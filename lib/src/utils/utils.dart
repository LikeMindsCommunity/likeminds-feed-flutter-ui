import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

extension StringColor on String {
  Color? toColor() {
    // if (primaryColor != null) {
    if (int.tryParse(this) != null) {
      return Color(int.tryParse(this)!);
    } else {
      return kPrimaryColor;
    }
  }
}

// Convert DateTime to Time Ago String
extension DateTimeAgo on DateTime {
  String timeAgo() {
    return format(this);
  }
}

// defines icon placement
// LMIconPlacement.start places the icon before the text
// LMIconPlacement.end places the icon after the text
enum LMIconPlacement { start, end }
