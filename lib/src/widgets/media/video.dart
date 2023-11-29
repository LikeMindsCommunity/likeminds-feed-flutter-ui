import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:media_kit_video/media_kit_video_controls/media_kit_video_controls.dart'
    as media_kit_video_controls;

class LMVideo extends StatefulWidget {
  // late final LMVideo? _instance;

  const LMVideo({
    super.key,
    this.videoUrl,
    this.videoFile,
    this.height,
    this.width,
    this.aspectRatio,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.loaderWidget,
    this.errorWidget,
    this.shimmerWidget,
    this.boxFit,
    this.playButton,
    this.pauseButton,
    this.muteButton,
    this.showControls,
    this.autoPlay,
    this.looping,
    this.allowFullScreen,
    this.allowMuting,
    this.isMute,
    this.progressTextStyle,
    this.seekBarBufferColor,
    this.seekBarColor,
    this.initialiseVideoController,
  }) : assert(videoUrl != null || videoFile != null);

  //Video asset variables
  final String? videoUrl;
  final File? videoFile;

  final Function(VideoController)? initialiseVideoController;

  // Video structure variables
  final double? height;
  final double? width;
  final double? aspectRatio; // defaults to 16/9
  final double? borderRadius; // defaults to 0
  final Color? borderColor;
  final double? borderWidth;
  final BoxFit? boxFit; // defaults to BoxFit.cover

  // Video styling variables
  final Color? seekBarColor;
  final Color? seekBarBufferColor;
  final TextStyle? progressTextStyle;
  final Widget? loaderWidget;
  final Widget? errorWidget;
  final Widget? shimmerWidget;
  final LMIconButton? playButton;
  final LMIconButton? pauseButton;
  final LMIconButton? muteButton;

  // Video functionality control variables
  final bool? isMute;
  final bool? showControls;
  final bool? autoPlay;
  final bool? looping;
  final bool? allowFullScreen;
  final bool? allowMuting;

  @override
  State<LMVideo> createState() => _LMVideoState();
}

class _LMVideoState extends VisibilityAwareState<LMVideo> {
  ValueNotifier<bool> rebuildOverlay = ValueNotifier(false);
  bool _onTouch = true;
  bool initialiseOverlay = false;
  ValueNotifier<bool> isMuted = ValueNotifier(false);
  Future<void>? initialiseController;
  ValueNotifier<bool> rebuildVideo = ValueNotifier(false);

  Player player = Player();
  VideoController? controller;

  Timer? _timer;

  @override
  void dispose() async {
    debugPrint("Disposing video");
    _timer?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LMVideo oldWidget) {
    super.didUpdateWidget(oldWidget);
    initialiseController = initialiseControllers();
  }

  @override
  void initState() {
    super.initState();
    initialiseController = initialiseControllers();
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    if (visibility == WidgetVisibility.INVISIBLE) {
      controller?.player.pause();
    } else if (visibility == WidgetVisibility.GONE) {
      controller?.player.pause();
    }
    super.onVisibilityChanged(visibility);
  }

  Future<void> initialiseControllers() async {
    player = Player(
      configuration: PlayerConfiguration(
        bufferSize: 24 * 1024 * 1024,
        ready: () {
          if (widget.isMute != null && widget.isMute!) player.setVolume(0);
        },
      ),
    );
    controller = VideoController(
      player,
      configuration: const VideoControllerConfiguration(
        scale: 0.2,
      ),
    );
    if (widget.initialiseVideoController != null) {
      widget.initialiseVideoController!(controller!);
    }
    if (widget.videoUrl != null) {
      await player.open(
        Media(widget.videoUrl!),
        play: widget.autoPlay ?? false,
      );
    } else {
      await player.open(
        Media(widget.videoFile!.uri.toString()),
        play: widget.autoPlay ?? false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: rebuildVideo,
        builder: (context, _, __) {
          return FutureBuilder(
            future: initialiseController,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LMPostMediaShimmer();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (!initialiseOverlay) {
                  _timer =
                      Timer.periodic(const Duration(milliseconds: 3000), (_) {
                    initialiseOverlay = true;
                    _onTouch = false;
                    rebuildOverlay.value = !rebuildOverlay.value;
                  });
                }
                return Stack(children: [
                  VisibilityDetector(
                    key: ObjectKey(player),
                    onVisibilityChanged: (visibilityInfo) async {
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage <= 70) {
                        controller?.player.pause();
                      }
                      if (visiblePercentage > 70) {
                        controller?.player.play();
                        rebuildOverlay.value = !rebuildOverlay.value;
                      }
                    },
                    child: Container(
                      width: widget.width ?? screenSize.width,
                      height: widget.height,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 0),
                        border: Border.all(
                          color: widget.borderColor ?? Colors.transparent,
                          width: 0,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: MaterialVideoControlsTheme(
                        normal: MaterialVideoControlsThemeData(
                          bottomButtonBar: [
                            const MaterialPositionIndicator(
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                if (player.state.volume > 0.0) {
                                  player.setVolume(0);
                                  isMuted.value = true;
                                } else {
                                  player.setVolume(100);
                                  isMuted.value = false;
                                }
                              },
                              icon: ValueListenableBuilder(
                                  valueListenable: isMuted,
                                  builder: (context, isMuted, __) {
                                    return LMIcon(
                                      type: LMIconType.icon,
                                      color: kWhiteColor,
                                      icon: isMuted
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                    );
                                  }),
                            )
                          ],
                          seekBarMargin: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 8,
                          ),
                          seekBarPositionColor: widget.seekBarColor ??
                              const Color.fromARGB(255, 0, 137, 123),
                          seekBarThumbColor: widget.seekBarColor ??
                              const Color.fromARGB(255, 0, 137, 123),
                        ),
                        fullscreen: const MaterialVideoControlsThemeData(),
                        child: Video(
                          controller: controller!,
                          controls: widget.showControls != null &&
                                  widget.showControls!
                              ? media_kit_video_controls.AdaptiveVideoControls
                              : (state) {
                                  return ValueListenableBuilder(
                                    valueListenable: rebuildOverlay,
                                    builder: (context, _, __) {
                                      return Visibility(
                                        visible: _onTouch,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                const CircleBorder(
                                                  side: BorderSide(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            child: Icon(
                                              controller != null &&
                                                      controller!
                                                          .player.state.playing
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              _timer?.cancel();
                                              if (controller == null) {
                                                return;
                                              }
                                              controller!.player.state.playing
                                                  ? state
                                                      .widget.controller.player
                                                      .pause()
                                                  : state
                                                      .widget.controller.player
                                                      .play();
                                              rebuildOverlay.value =
                                                  !rebuildOverlay.value;
                                              _timer = Timer.periodic(
                                                const Duration(
                                                    milliseconds: 2500),
                                                (_) {
                                                  _onTouch = false;
                                                  rebuildOverlay.value =
                                                      !rebuildOverlay.value;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                        ),
                      ),
                    ),
                  ),
                ]);
              } else {
                return widget.errorWidget ?? const SizedBox();
              }
            },
          );
        });
  }
}
