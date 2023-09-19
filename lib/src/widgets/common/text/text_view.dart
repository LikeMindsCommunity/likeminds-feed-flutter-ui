import 'package:flutter/material.dart';

class LMTextView extends StatelessWidget {
  final String text;
  final bool selectable;
  final Function()? onTap;

  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const LMTextView({
    Key? key,
    required this.text,
    this.selectable = true,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.textStyle,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? defaultTextStyle = Theme.of(context).textTheme.bodyMedium;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: textStyle ?? defaultTextStyle,
      ),
    );
  }
}
