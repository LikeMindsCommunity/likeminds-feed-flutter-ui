import 'dart:io';

import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/shimmer/document_shimmer.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';

class LMDocument extends StatefulWidget {
  const LMDocument({
    super.key,
    this.onTap,
    this.documentFile,
    this.documentUrl,
    this.height,
    this.width,
    this.type,
    this.size,
    this.borderRadius,
    this.borderSize,
    this.borderColor,
    this.title,
    this.subtitle,
    this.documentIcon,
  }) : assert(documentFile != null || documentUrl != null);

  final Function()? onTap;

  final File? documentFile;
  final String? documentUrl;
  final String? type;
  final String? size;

  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderSize;
  final Color? borderColor;

  final LMTextView? title;
  final LMTextView? subtitle;
  final LMIcon? documentIcon;

  @override
  State<LMDocument> createState() => _LMDocumentState();
}

class _LMDocumentState extends State<LMDocument> {
  String? _fileName;
  String? _fileExtension;
  String? _fileSize;
  String? url;
  File? file;

  Future loadFile() async {
    File file;
    if (widget.documentUrl != null) {
      final String url = widget.documentUrl!;
      file = File(url);
    } else {
      file = widget.documentFile!;
    }
    _fileExtension = widget.type;
    _fileSize = widget.size;
    _fileName = basenameWithoutExtension(file.path);
    return file;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return GestureDetector(
              onTap: widget.onTap,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: kPaddingSmall,
                ),
                height: widget.height ?? 78,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.borderColor ?? kGreyWebBGColor,
                    width: widget.borderSize ?? 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? kBorderRadiusMedium,
                  ),
                ),
                padding: const EdgeInsets.all(kPaddingLarge),
                child: Row(
                  children: [
                    widget.documentIcon ??
                        const LMIcon(
                          icon: Icons.picture_as_pdf,
                          size: 42,
                          color: Colors.red,
                        ),
                    kHorizontalPaddingLarge,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LMTextView(
                            text: _fileName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textStyle: const TextStyle(
                              fontSize: kFontMedium,
                              color: kGrey2Color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          kVerticalPaddingSmall,
                          Row(
                            children: [
                              kHorizontalPaddingXSmall,
                              Text(
                                _fileSize!.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: kFontSmall, color: kGrey3Color),
                              ),
                              kHorizontalPaddingXSmall,
                              const Text(
                                '·',
                                style: TextStyle(
                                    fontSize: kFontSmall, color: kGrey3Color),
                              ),
                              kHorizontalPaddingXSmall,
                              Text(
                                _fileExtension!.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: kFontSmall, color: kGrey3Color),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    widget.documentFile != null
                        ? GestureDetector(
                            onTap: () {
                              // widget.removeAttachment!(widget.index!);
                            },
                            child: LMIconButton(
                              icon: const LMIcon(icon: Icons.close),
                              onTap: (active) {},
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const LMDocumentShimmer();
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
