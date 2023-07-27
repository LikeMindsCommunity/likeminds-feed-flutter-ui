import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class LMProfilePicture extends StatelessWidget {
  const LMProfilePicture({
    super.key,
    this.imageUrl,
    required this.fallbackText,
    this.size = 48,
    this.borderRadius = 24,
    this.border = 0,
    this.backgroundColor,
  });

  final double size;
  final String? imageUrl;
  final String fallbackText;
  final double borderRadius;
  final double border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white,
          width: border,
        ),
        color: imageUrl != null && imageUrl!.isNotEmpty
            ? kGrey3Color
            : backgroundColor ?? Theme.of(context).primaryColor,
        image: imageUrl != null && imageUrl!.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null || imageUrl!.isEmpty
          ? Center(
              child: Text(
                fallbackText.isNotEmpty ? fallbackText[0].toUpperCase() : "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size / 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : null,
    );
  }
}
