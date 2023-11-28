import 'package:flutter/material.dart';

import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';

class LMBottomSheet extends StatefulWidget {
  final LMTextView? title;
  final Alignment? titleAlignment;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? elevation;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final List<Widget> children;
  final List<BoxShadow>? boxShadow;
  final Widget? dragBar;
  final Color? dragBarColor;

  const LMBottomSheet({
    Key? key,
    required this.children,
    this.title,
    this.titleAlignment,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.elevation,
    this.padding,
    this.margin,
    this.boxShadow,
    this.dragBar,
    this.dragBarColor,
  }) : super(key: key);

  @override
  State<LMBottomSheet> createState() => _LMBottomSheetState();
}

class _LMBottomSheetState extends State<LMBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      width: screenSize.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? theme.colorScheme.background,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      constraints: BoxConstraints(
        maxHeight: widget.height ?? 300,
        minHeight: screenSize.height * 0.2,
      ),
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          widget.dragBar ??
              Container(
                width: 48,
                height: 8,
                decoration: ShapeDecoration(
                  color: widget.dragBarColor ?? theme.colorScheme.background
                    ..withAlpha(200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => widget.children[index],
              itemCount: widget.children.length,
            ),
          ),
        ],
      ),
    );
  }
}
