import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class LMTextInput extends StatefulWidget {
  const LMTextInput({
    super.key,
    this.controller,
    this.focusNode,
    this.profilePicture,
    this.hintText,
    this.hintStyle,
    this.inputStyle,
    this.sendButton,
    this.fieldColor,
    this.backgroundColor,
    this.borderRadius,
    this.externalPadding,
    this.internalPadding,
    this.enabled = true,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;

  final LMProfilePicture? profilePicture;
  final String? hintText;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final Widget? sendButton;

  final Color? backgroundColor;
  final Color? fieldColor;
  final double? borderRadius;
  final double? externalPadding;
  final double? internalPadding;

  @override
  State<LMTextInput> createState() => _LMTextInputState();
}

class _LMTextInputState extends State<LMTextInput> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width,
      padding: EdgeInsets.symmetric(
        horizontal: widget.externalPadding ?? 0,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
            child: widget.profilePicture != null
                ? widget.profilePicture!
                : const SizedBox(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
                color: widget.fieldColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.internalPadding ?? 4,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.internalPadding ?? 0),
                        child: TextField(
                          maxLines: 4,
                          minLines: 1,
                          focusNode: widget.focusNode,
                          controller: widget.controller,
                          decoration: InputDecoration(
                            hintText:
                                widget.hintText ?? "Write something here..",
                            enabled: widget.enabled,
                            hintStyle: widget.hintStyle ??
                                const TextStyle(
                                  color: kGrey1Color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                            border: InputBorder.none,
                          ),
                          style: widget.inputStyle ??
                              const TextStyle(
                                color: kGrey1Color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          widget.sendButton ?? const SizedBox(),
        ],
      ),
    );
  }
}
