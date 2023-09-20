import 'dart:io';
import 'package:http/http.dart' as http;

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

Future<Map<String, int>> getImageFileDimensions(File image) async {
  Map<String, int> dimensions = {};
  final decodedImage = await decodeImageFromList(image.readAsBytesSync());
  dimensions.addAll({"width": decodedImage.width});
  dimensions.addAll({"height": decodedImage.height});
  return dimensions;
}

Future<Map<String, int>> getNetworkImageDimensions(String image) async {
  Map<String, int> dimensions = {};
  final response = await http.get(Uri.parse(image));
  final bytes = response.bodyBytes;
  final decodedImage = await decodeImageFromList(bytes);
  dimensions.addAll({"width": decodedImage.width});
  dimensions.addAll({"height": decodedImage.height});
  return dimensions;
}

// defines icon placement
// LMIconPlacement.start places the icon before the text
// LMIconPlacement.end places the icon after the text
enum LMIconPlacement { start, end }
