import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/image.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/video.dart';

class LMCarousel extends StatefulWidget {
  final List<Attachment> attachments;

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderSize;
  final Color? borderColor;

  final Widget? activeIndicator;
  final Widget? inactiveIndicator;

  final LMImage? imageItem;
  final LMVideo? videoItem;

  const LMCarousel({
    Key? key,
    required this.attachments,
    this.height,
    this.width,
    this.borderRadius,
    this.borderSize,
    this.borderColor,
    this.activeIndicator,
    this.inactiveIndicator,
    this.imageItem,
    this.videoItem,
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
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: widget.imageItem ??
                LMImage(
                  imageUrl: e.attachmentMeta.url,
                  borderRadius: widget.borderRadius,
                  borderColor: widget.borderColor,
                  boxFit: BoxFit.contain,
                ),
          ),
        );
      } else if ((e.attachmentType == 2)) {
        return Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: widget.videoItem ??
              LMVideo(
                videoUrl: e.attachmentMeta.url,
                borderRadius: widget.borderRadius,
                borderColor: widget.borderColor,
                boxFit: BoxFit.contain,
                showControls: false,
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
    final size = MediaQuery.of(context).size.width;
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
                initialPage: 0,
                animateToClosest: false,
                aspectRatio: 1,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: false,
                enlargeFactor: 0.0,
                viewportFraction: 1.0,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
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
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: kPrimaryColor,
                                        ),
                                      )
                                  : widget.inactiveIndicator ??
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          color: kGrey1Color,
                                          // color: Color.fromRGBO(0, 0, 0, 0.4),
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
