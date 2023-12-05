import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/image.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/video.dart';
import 'package:media_kit_video/media_kit_video.dart';

class LMCarousel extends StatefulWidget {
  final List<Attachment> attachments;
  final Function(VideoController)? initialiseVideoController;

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderSize;
  final Color? borderColor;
  final Color? activeIndicatorColor;
  final Color? inactiveIndicatorColor;
  final Color? backgroundColor;
  final Widget? activeIndicator;
  final Widget? inactiveIndicator;

  final LMImage? imageItem;
  final LMVideo? videoItem;
  final Widget? errorWidget;
  final BoxFit? boxFit;
  final Function(String, StackTrace)? onError;

  const LMCarousel({
    Key? key,
    required this.attachments,
    this.height,
    this.width,
    this.borderRadius,
    this.borderSize,
    this.borderColor,
    this.backgroundColor,
    this.activeIndicator,
    this.inactiveIndicator,
    this.imageItem,
    this.videoItem,
    this.activeIndicatorColor,
    this.inactiveIndicatorColor,
    this.errorWidget,
    this.boxFit,
    this.initialiseVideoController,
    this.onError,
  }) : super(key: key);

  @override
  State<LMCarousel> createState() => _LMCarouselState();
}

class _LMCarouselState extends State<LMCarousel> {
  final ValueNotifier<bool> rebuildCurr = ValueNotifier(false);
  List<Widget> mediaWidgets = [];
  int currPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  bool checkIfMultipleAttachments() {
    return ((widget.attachments.isNotEmpty && widget.attachments.length > 1));
  }

  void mapAttachmentsToWidget() {
    mediaWidgets = widget.attachments.map((e) {
      if (e.attachmentType == 1) {
        return Container(
          color: widget.backgroundColor ?? Colors.black,
          width:widget.width?? MediaQuery.of(context).size.width,
          child: Center(
            child: widget.imageItem ??
                LMImage(
                  imageUrl: e.attachmentMeta.url,
                  height: widget.height,
                  width: widget.width,
                  borderRadius: widget.borderRadius,
                  borderColor: widget.borderColor,
                  boxFit: widget.boxFit ?? BoxFit.contain,
                  errorWidget: widget.errorWidget,
                  onError: widget.onError,
                ),
          ),
        );
      } else if ((e.attachmentType == 2)) {
        return Container(
          color: widget.backgroundColor ?? Colors.black,
          width: MediaQuery.of(context).size.width,
          child: widget.videoItem ??
              Center(
                child: LMVideo(
                  initialiseVideoController: widget.initialiseVideoController,
                  videoUrl: e.attachmentMeta.url,
                  width: widget.width,
                  height: widget.height,
                  borderRadius: widget.borderRadius,
                  borderColor: widget.borderColor,
                  boxFit: widget.boxFit ?? BoxFit.contain,
                  showControls: false,
                  errorWidget: widget.errorWidget,
                ),
              ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    mapAttachmentsToWidget();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        border: Border.all(
          color: widget.borderColor ?? Colors.transparent,
          width: widget.borderSize ?? 0,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            child: CarouselSlider.builder(
              itemCount: mediaWidgets.length,
              itemBuilder: (context, index, _) => mediaWidgets[index],
              options: CarouselOptions(
                animateToClosest: false,
                aspectRatio: 1,
                enableInfiniteScroll: false,
                enlargeFactor: 0.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  currPosition = index;
                  rebuildCurr.value = !rebuildCurr.value;
                },
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: rebuildCurr,
              builder: (context, _, __) {
                return Column(
                  children: [
                    checkIfMultipleAttachments()
                        ? kVerticalPaddingMedium
                        : const SizedBox(),
                    checkIfMultipleAttachments()
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.attachments.map((url) {
                              int index = widget.attachments.indexOf(url);
                              return currPosition == index
                                  ? widget.activeIndicator ??
                                      Container(
                                        width: 16.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: widget.activeIndicatorColor ??
                                              kPrimaryColor,
                                        ),
                                      )
                                  : widget.inactiveIndicator ??
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color:
                                              widget.inactiveIndicatorColor ??
                                                  kGrey1Color,
                                        ),
                                      );
                            }).toList())
                        : const SizedBox(),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
