import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/buttons/icon_button.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/shimmer/post_shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LMVideo extends StatefulWidget {
  const LMVideo({
    super.key,
    this.videoUrl,
    this.videoFile,
    this.height,
    this.width,
    this.aspectRatio,
    this.borderRadius,
    this.borderColor,
    this.loaderWidget,
    this.errorWidget,
    this.shimmerWidget,
    this.boxFit,
    this.videoPlayerController,
    this.playButton,
    this.pauseButton,
    this.muteButton,
    this.showControls,
    this.autoPlay,
    this.looping,
    this.allowFullScreen,
    this.allowMuting,
  }) : assert(videoUrl != null || videoFile != null);

  final String? videoUrl;
  final File? videoFile;

  final double? height;
  final double? width;
  final double? aspectRatio;
  final double? borderRadius;
  final Color? borderColor;

  final Widget? loaderWidget;
  final Widget? errorWidget;
  final Widget? shimmerWidget;

  final BoxFit? boxFit;

  final VideoPlayerController? videoPlayerController;
  final LMIconButton? playButton;
  final LMIconButton? pauseButton;
  final LMIconButton? muteButton;
  final bool? showControls;
  final bool? autoPlay;
  final bool? looping;
  final bool? allowFullScreen;
  final bool? allowMuting;

  @override
  State<LMVideo> createState() => _LMVideoState();
}

class _LMVideoState extends State<LMVideo> {
  late final VideoPlayerController videoPlayerController;
  ValueNotifier<bool> rebuildOverlay = ValueNotifier(false);
  late ChewieController chewieController;
  bool _onTouch = true;
  bool initialiseOverlay = false;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    // videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> initialiseControllers() async {
    if (widget.videoUrl != null) {
      videoPlayerController = widget.videoPlayerController ??
          VideoPlayerController.networkUrl(
            Uri.parse(widget.videoUrl!),
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: false,
            ),
          );
    } else {
      videoPlayerController = widget.videoPlayerController ??
          VideoPlayerController.file(
            widget.videoFile!,
            videoPlayerOptions: VideoPlayerOptions(
              allowBackgroundPlayback: false,
            ),
          );
    }
    chewieController = ChewieController(
      aspectRatio: widget.aspectRatio,
      videoPlayerController: videoPlayerController,
      autoPlay: widget.autoPlay ?? false,
      looping: widget.looping ?? true,
      showOptions: false,
      showControls: false,
      allowPlaybackSpeedChanging: false,
      allowMuting: widget.allowMuting ?? false,
      allowFullScreen: widget.allowFullScreen ?? false,
      autoInitialize: false,
      showControlsOnInitialize: false,
      overlay: ClipRRect(borderRadius: BorderRadius.circular(12)),
      errorBuilder: (context, errorMessage) {
        return widget.errorWidget ??
            Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.black),
              ),
            );
      },
    );
    if (!videoPlayerController.value.isInitialized) {
      await videoPlayerController.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: initialiseControllers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LMPostShimmer();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (!initialiseOverlay) {
            _timer = Timer.periodic(const Duration(milliseconds: 2500), (_) {
              initialiseOverlay = true;
              _onTouch = false;
              rebuildOverlay.value = !rebuildOverlay.value;
            });
          }
          return Stack(children: [
            GestureDetector(
              onTap: () {
                _onTouch = !_onTouch;
                rebuildOverlay.value = !rebuildOverlay.value;
                // locator<NavigationService>().navigateTo(
                //   MediaPreviewScreen.routeName,
                //   arguments: MediaPreviewArguments(
                //     mediaUrl: widget.url,
                //     mediaFile: widget.videoFile,
                //   ),
                // );
              },
              child: VisibilityDetector(
                key: Key('post_video_${widget.videoUrl ?? widget.videoFile}'),
                onVisibilityChanged: (visibilityInfo) async {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage <= 50) {
                    videoPlayerController.pause();
                  }
                  if (visiblePercentage > 50) {
                    videoPlayerController.play();
                    rebuildOverlay.value = !rebuildOverlay.value;
                  }
                },
                child: Container(
                  width: widget.width ?? screenSize.width,
                  height: widget.height ?? screenSize.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 0),
                    border: Border.all(
                      color: widget.borderColor ?? Colors.transparent,
                      width: 0,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 0),
                    child: Chewie(
                      controller: chewieController,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ValueListenableBuilder(
                  valueListenable: rebuildOverlay,
                  builder: (context, _, __) {
                    return Visibility(
                      visible: _onTouch,
                      child: Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(const CircleBorder(
                                side: BorderSide(color: Colors.white))),
                          ),
                          child: Icon(
                            videoPlayerController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _timer?.cancel();

                            // pause while video is playing, play while video is pausing

                            videoPlayerController.value.isPlaying
                                ? videoPlayerController.pause()
                                : videoPlayerController.play();
                            rebuildOverlay.value = !rebuildOverlay.value;

                            // Auto dismiss overlay after 1 second
                            _timer = Timer.periodic(
                                const Duration(milliseconds: 2500), (_) {
                              _onTouch = false;
                              rebuildOverlay.value = !rebuildOverlay.value;
                            });
                          },
                        ),
                      ),
                    );
                  }),
            )
          ]);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
