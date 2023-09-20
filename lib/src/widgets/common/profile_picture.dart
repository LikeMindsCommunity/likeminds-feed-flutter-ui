import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class LMProfilePicture extends StatelessWidget {
  const LMProfilePicture(
      {super.key,
      this.imageUrl,
      required this.fallbackText,
      this.size = 48,
      this.borderRadius = 24,
      this.border = 0,
      this.backgroundColor,
      this.boxShape,
      this.onTap});

  final double size;
  final String? imageUrl;
  final String fallbackText;
  final double borderRadius;
  final double border;
  final Color? backgroundColor;
  final BoxShape? boxShape;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius:
              boxShape == null ? BorderRadius.circular(borderRadius) : null,
          border: Border.all(
            color: Colors.white,
            width: border,
          ),
          shape: boxShape ?? BoxShape.rectangle,
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
      ),
    );
  }
}
