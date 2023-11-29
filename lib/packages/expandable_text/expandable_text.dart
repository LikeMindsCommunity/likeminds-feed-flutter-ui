library expandable_text;

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/packages/linkify/linkify.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import './text_parser.dart';

typedef StringCallback = void Function(String value);

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    required this.expandText,
    this.collapseText,
    this.expanded = false,
    this.onExpandedChanged,
    this.onLinkTap,
    this.linkColor,
    this.linkEllipsis = true,
    this.linkStyle,
    this.prefixText,
    this.prefixStyle,
    this.onPrefixTap,
    this.urlStyle,
    this.onUrlTap,
    this.hashtagStyle,
    this.onHashtagTap,
    this.mentionStyle,
    this.onMentionTap,
    this.expandOnTextTap = false,
    this.collapseOnTextTap = false,
    this.style,
    this.textDirection,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines = 2,
    this.animation = false,
    this.animationDuration,
    this.animationCurve,
    this.semanticsLabel,
    required this.onTagTap,
  })  : assert(maxLines > 0),
        super(key: key);

  final String text;
  final String expandText;
  final String? collapseText;
  final bool expanded;
  final ValueChanged<bool>? onExpandedChanged;
  final VoidCallback? onLinkTap;
  final Color? linkColor;
  final bool linkEllipsis;
  final TextStyle? linkStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final VoidCallback? onPrefixTap;
  final TextStyle? urlStyle;
  final StringCallback? onUrlTap;
  final TextStyle? hashtagStyle;
  final StringCallback? onHashtagTap;
  final TextStyle? mentionStyle;
  final StringCallback? onMentionTap;
  final bool expandOnTextTap;
  final bool collapseOnTextTap;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int maxLines;
  final bool animation;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final String? semanticsLabel;
  final Function(String) onTagTap; // user id of the tag of user tapped

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin {
  bool _expanded = false;
  RegExp regExp = RegExp(kRegexLinksAndTags);
  late TapGestureRecognizer _linkTapGestureRecognizer;
  late TapGestureRecognizer _prefixTapGestureRecognizer;

  List<TextSegment> _textSegments = [];
  final List<TapGestureRecognizer> _textSegmentsTapGestureRecognizers = [];

  @override
  void initState() {
    super.initState();
    _expanded = widget.expanded;
    _linkTapGestureRecognizer = TapGestureRecognizer()..onTap = _linkTapped;
    _prefixTapGestureRecognizer = TapGestureRecognizer()..onTap = _prefixTapped;

    _updateText();
  }

  @override
  void didUpdateWidget(ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text ||
        oldWidget.onUrlTap != widget.onUrlTap ||
        oldWidget.onHashtagTap != widget.onHashtagTap ||
        oldWidget.onMentionTap != widget.onMentionTap) {
      _updateText();
    }
  }

  @override
  void dispose() {
    _linkTapGestureRecognizer.dispose();
    _prefixTapGestureRecognizer.dispose();
    for (var recognizer in _textSegmentsTapGestureRecognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  void _linkTapped() {
    if (widget.onLinkTap != null) {
      widget.onLinkTap!();
      return;
    }

    final toggledExpanded = !_expanded;

    setState(() => _expanded = toggledExpanded);

    widget.onExpandedChanged?.call(toggledExpanded);
  }

  void _prefixTapped() {
    widget.onPrefixTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    var effectiveTextStyle = widget.style;
    if (widget.style == null || widget.style!.inherit) {
      effectiveTextStyle = defaultTextStyle.style.merge(widget.style);
    }

    final linkText =
        (_expanded ? widget.collapseText : widget.expandText) ?? '';
    final linkColor = widget.linkColor ??
        widget.prefixStyle?.color ??
        const Color(0xFF4666F6);
    final linkTextStyle = effectiveTextStyle!
        .merge(widget.prefixStyle)
        .copyWith(color: linkColor);

    final prefixText =
        widget.prefixText != null && widget.prefixText!.isNotEmpty
            ? '${widget.prefixText} '
            : '';

    final link = TextSpan(
      children: [
        if (!_expanded)
          TextSpan(
            text: '\u2026 ',
            style: widget.linkEllipsis ? linkTextStyle : effectiveTextStyle,
            recognizer: widget.linkEllipsis ? _linkTapGestureRecognizer : null,
          ),
        if (linkText.isNotEmpty)
          TextSpan(
            style: effectiveTextStyle,
            children: <TextSpan>[
              if (_expanded)
                const TextSpan(
                  text: ' ',
                ),
              TextSpan(
                text: linkText,
                style: linkTextStyle,
                recognizer: _linkTapGestureRecognizer,
              ),
            ],
          ),
      ],
    );

    final prefix = extractLinksAndTags(prefixText);
    final text = extractLinksAndTags(widget.text);

    final content = TextSpan(
      children: <TextSpan>[...prefix, ...text],
      style: effectiveTextStyle,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final textAlign =
            widget.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;
        final textDirection =
            widget.textDirection ?? Directionality.of(context);
        final textScaleFactor =
            widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context);
        final locale = Localizations.maybeLocaleOf(context);

        TextPainter textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: 3,
          locale: locale,
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        textPainter.text = content;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          final position = textPainter.getPositionForOffset(Offset(
            textSize.width - linkSize.width,
            textSize.height,
          ));
          final endOffset =
              (textPainter.getOffsetBefore(position.offset) ?? 0) -
                  prefixText.length;

          final recognizer =
              (_expanded ? widget.collapseOnTextTap : widget.expandOnTextTap)
                  ? _linkTapGestureRecognizer
                  : null;
          String resultText;
          if (!_expanded) {
            var response =
                TaggingHelper.convertRouteToTagAndUserMap(widget.text);
            List<UserTag> userTags = response['userTags'];
            resultText = response['text'];
            // final lineCount = textPainter.computeLineMetrics().length;
            final nCount = '\n'.allMatches(resultText).length + 1;
            if (resultText.length > 300 && nCount <= 4) {
              resultText = resultText.substring(0, max(endOffset, 0));
            } else {
              resultText = resultText.substring(0, max(endOffset, 0));
            }

            resultText = TaggingHelper.encodeString(resultText, userTags);
          } else {
            resultText = widget.text;
          }

          final text = _textSegments.isNotEmpty
              ? TextSpan(
                  children: _buildTextSpans(
                      _expanded ? _textSegments : parseText(resultText),
                      effectiveTextStyle!,
                      recognizer),
                )
              : TextSpan(
                  children: extractLinksAndTags(resultText),
                );

          textSpan = TextSpan(
            style: effectiveTextStyle,
            children: <TextSpan>[
              ...prefix,
              text,
              link,
            ],
          );
        } else {
          textSpan = content;
        }

        final richText = SelectableText.rich(
          textSpan,
          textDirection: textDirection,
          textAlign: textAlign,
          textScaleFactor: textScaleFactor,
          style: widget.style,
        );

        if (widget.animation) {
          return AnimatedSize(
              duration:
                  widget.animationDuration ?? const Duration(milliseconds: 200),
              curve: widget.animationCurve ?? Curves.fastLinearToSlowEaseIn,
              alignment: Alignment.topLeft,
              child: richText);
        }

        return richText;
      },
    );

    if (widget.semanticsLabel != null) {
      result = Semantics(
        textDirection: widget.textDirection,
        label: widget.semanticsLabel,
        child: ExcludeSemantics(
          child: result,
        ),
      );
    }

    return result;
  }

  void _updateText() {
    for (var recognizer in _textSegmentsTapGestureRecognizers) {
      recognizer.dispose();
    }
    _textSegmentsTapGestureRecognizers.clear();

    if (widget.onUrlTap == null &&
        widget.onHashtagTap == null &&
        widget.onMentionTap == null) {
      _textSegments.clear();
      return;
    }

    _textSegments = parseText(widget.text);

    for (var element in _textSegments) {
      if (element.isUrl && widget.onUrlTap != null) {
        final recognizer = TapGestureRecognizer()
          ..onTap = () {
            widget.onUrlTap!(element.name!);
          };

        _textSegmentsTapGestureRecognizers.add(recognizer);
      } else if (element.isHashtag && widget.onHashtagTap != null) {
        final recognizer = TapGestureRecognizer()
          ..onTap = () {
            widget.onHashtagTap!(element.name!);
          };

        _textSegmentsTapGestureRecognizers.add(recognizer);
      } else if (element.isMention && widget.onMentionTap != null) {
        final recognizer = TapGestureRecognizer()
          ..onTap = () {
            widget.onMentionTap!(element.name!);
          };

        _textSegmentsTapGestureRecognizers.add(recognizer);
      }
    }
  }

  List<TextSpan> _buildTextSpans(List<TextSegment> segments,
      TextStyle textStyle, TapGestureRecognizer? textTapRecognizer) {
    final spans = <TextSpan>[];

    var index = 0;
    for (var segment in segments) {
      TextStyle? style;
      TapGestureRecognizer? recognizer;

      if (segment.isUrl && widget.onUrlTap != null) {
        style = textStyle.merge(widget.urlStyle);
        recognizer = _textSegmentsTapGestureRecognizers[index++];
      } else if (segment.isMention && widget.onMentionTap != null) {
        style = textStyle.merge(widget.mentionStyle);
        recognizer = _textSegmentsTapGestureRecognizers[index++];
      } else if (segment.isHashtag && widget.onHashtagTap != null) {
        style = textStyle.merge(widget.hashtagStyle);
        recognizer = _textSegmentsTapGestureRecognizers[index++];
      }

      final span = TextSpan(
        text: segment.text,
        style: style,
        recognizer: recognizer ?? textTapRecognizer,
      );

      spans.add(span);
    }

    return spans;
  }

  List<TextSpan> extractLinksAndTags(String text) {
    List<TextSpan> textSpans = [];
    int lastIndex = 0;
    for (Match match in regExp.allMatches(text)) {
      int startIndex = match.start;
      int endIndex = match.end;
      String? link = match.group(0);

      if (lastIndex != startIndex) {
        // Add a TextSpan for the preceding text
        textSpans.add(TextSpan(
          text: text.substring(lastIndex, startIndex),
          style: widget.style,
        ));
      }
      if (link != null && link.isNotEmpty && link[0] == '#') {
        textSpans.add(TextSpan(
          text: link,
          style: widget.hashtagStyle ?? const TextStyle(color: kPrimaryColor),
        ));
      } else {
        bool isTag = link != null && link[0] == '<';

        // if it is a valid link using linkify and
        // if that is not then add normal TextSpan
        if (!isTag && extractLinkAndEmailFromString(link ?? '') == null) {
          textSpans.add(TextSpan(
            text: text.substring(startIndex, endIndex),
            style: widget.style,
          ));
          lastIndex = endIndex;
          continue;
        }
        // Add a TextSpan for the URL
        textSpans.add(TextSpan(
          text: isTag ? TaggingHelper.decodeString(link).keys.first : link,
          style: widget.linkStyle ?? const TextStyle(color: kPrimaryColor),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (!isTag) {
                final checkLink = extractLinkAndEmailFromString(link ?? '');
                debugPrint('checkLink: $checkLink');
                if (checkLink is UrlElement) {
                  if (Uri.parse(checkLink.url).isAbsolute) {
                    launchUrl(
                      Uri.parse(checkLink.url),
                      mode: LaunchMode.externalApplication,
                    );
                  }
                } else if (checkLink is EmailElement) {
                  launchUrl(
                    Uri.parse('mailto:${checkLink.emailAddress}'),
                    mode: LaunchMode.externalApplication,
                  );
                }
              } else {
                widget.onTagTap(
                  TaggingHelper.decodeString(link).values.first,
                );
                // TaggingHelper.routeToProfile(
                //   TaggingHelper.decodeString(link).values.first,
                // );
              }
            },
        ));
      }

      lastIndex = endIndex;
    }

    if (lastIndex != text.length) {
      // Add a TextSpan for the remaining text
      textSpans.add(TextSpan(
        text: text.substring(lastIndex),
        style: widget.style,
      ));
    }

    return textSpans;
  }
}
