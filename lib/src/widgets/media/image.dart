import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';

class LMImage extends StatefulWidget {
  const LMImage({
    super.key,
    this.imageUrl,
    this.imageFile,
    this.height,
    this.width,
    this.aspectRatio,
    this.borderRadius,
    this.borderColor,
    this.loaderWidget,
    this.errorWidget,
    this.shimmerWidget,
    this.boxFit,
  }) : assert(imageUrl != null || imageFile != null);

  final String? imageUrl;
  final File? imageFile;

  final double? height;
  final double? width;
  final double? aspectRatio;
  final double? borderRadius;
  final Color? borderColor;

  final Widget? loaderWidget;
  final Widget? errorWidget;
  final Widget? shimmerWidget;

  final BoxFit? boxFit;

  @override
  State<LMImage> createState() => _LMImageState();
}

class _LMImageState extends State<LMImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.imageFile != null
            ? getImageFileDimensions(widget.imageFile!)
            : getNetworkImageDimensions(widget.imageUrl!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final result = snapshot.data!;
            final imageHeight = result["height"]!;
            final imageWidth = result["width"]!;
            return widget.imageUrl != null
                ? ClipRRect(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 0),
                    child: CachedNetworkImage(
                      height: widget.height ?? imageHeight.toDouble(),
                      width: widget.width ?? imageWidth.toDouble(),
                      imageUrl: widget.imageUrl!,
                      fit: widget.boxFit != null
                          ? widget.boxFit!
                          : imageHeight > imageWidth
                              ? BoxFit.fitWidth
                              : BoxFit.fitHeight,
                      fadeInDuration: const Duration(
                        milliseconds: 100,
                      ),
                      errorWidget: (context, url, error) {
                        return widget.errorWidget ??
                            Container(
                              color: kBackgroundColor,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LMIcon(
                                    type: LMIconType.icon,
                                    icon: Icons.error_outline,
                                    size: 24,
                                    color: kGrey3Color,
                                  ),
                                  SizedBox(height: 24),
                                  Text(
                                    "An error occurred fetching media",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            );
                      },
                      progressIndicatorBuilder: (context, url, progress) =>
                          widget.shimmerWidget ?? const LMPostShimmer(),
                    ),
                  )
                : widget.imageFile != null
                    ? ClipRRect(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 0),
                        child: Image.file(
                          widget.imageFile!,
                          height: widget.height ?? imageHeight.toDouble(),
                          width: widget.width ?? imageWidth.toDouble(),
                          fit: widget.boxFit != null
                              ? widget.boxFit!
                              : imageHeight > imageWidth
                                  ? BoxFit.fitWidth
                                  : BoxFit.fitHeight,
                        ),
                      )
                    : const SizedBox();
          }
          return LMPostShimmer();
        });
  }
}
