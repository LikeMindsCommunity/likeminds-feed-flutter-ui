import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/typedefs.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/buttons/icon_button.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/buttons/text_button.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';

class LMPostFooter extends StatelessWidget {
  const LMPostFooter({
    super.key,
    this.children,
    this.alignment = LMAlignment.left,
  });

  final List<Widget>? children;
  final LMAlignment alignment;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;

    switch (alignment) {
      case LMAlignment.left:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case LMAlignment.centre:
        mainAxisAlignment = MainAxisAlignment.spaceBetween;
        break;
      case LMAlignment.right:
        mainAxisAlignment = MainAxisAlignment.end;
        break;
      default:
        mainAxisAlignment = MainAxisAlignment.start;
        break;
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: children ??
          [
            LMTextButton(
              text: const LMTextView(text: "Like"),
              onTap: () {},
              icon: const LMIcon(
                type: LMIconType.icon,
                icon: Icons.favorite_outline,
                size: 28,
              ),
              activeIcon: const LMIcon(
                type: LMIconType.icon,
                icon: Icons.favorite,
                size: 28,
                color: Colors.red,
              ),
            ),
            // LMLikeButton(),
            const SizedBox(width: 16),
            LMTextButton(
              text: const LMTextView(text: "Comment"),
              onTap: () {},
              icon: const LMIcon(
                type: LMIconType.icon,
                icon: Icons.message_outlined,
                size: 28,
              ),
            ),
            const Spacer(),
            LMIconButton(
              icon: const LMIcon(
                type: LMIconType.icon,
                icon: Icons.bookmark_border_outlined,
                size: 28,
              ),
              onTap: (active) {},
            ),
            const SizedBox(width: 12),
            LMIconButton(
              icon: const LMIcon(
                type: LMIconType.icon,
                icon: Icons.share_outlined,
                size: 28,
              ),
              onTap: (active) {},
            ),
          ],
    );
  }
}

// class LMLikeButton extends LMTextView {
//   LMLikeButton({
//     super.key,
//     ValueNotifier<bool>? rebuildLikeButton,
//   })  : _rebuildLikeButton = rebuildLikeButton,
//         super(text: "Like");

//   final ValueNotifier<bool>? _rebuildLikeButton;

//   @override
//   Widget build(BuildContext context) {
//     return LMTextView(
//       text: "Like",
//       valueNotifier: _rebuildLikeButton,
//       leadingIcon: const LMIcon(
//         inactiveIcon: Icon(
//           Icons.favorite_outline,
//         ),
//         activeIcon: Icon(
//           Icons.favorite,
//           color: kPrimaryColor,
//         ),
//       ),
//       activeTextStyle:
//        Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
//       inactiveTextStyle: Theme.of(context).textTheme.bodyLarge,
//     );
//   }
// }

// class LMCommentButton extends StatefulWidget {
//   LMCommentButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LMTextView(
//       text: "Comment",
//       textStyle:
//       Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
//     );
//   }
// }

// class LMSaveButton extends LMTextView {
//   LMSaveButton({
//     super.key,
//     ValueNotifier<bool>? rebuildSaveButton,
//   })  : _rebuildSaveButton = rebuildSaveButton,
//         super(text: "Save");

//   final ValueNotifier<bool>? _rebuildSaveButton;

//   @override
//   Widget build(BuildContext context) {
//     return LMTextView(
//       text: "",
//       valueNotifier: _rebuildSaveButton,
//       leadingIcon: const LMIcon(
//         inactiveIcon: Icon(
//           Icons.bookmark_border,
//         ),
//         activeIcon: Icon(
//           Icons.bookmark,
//           color: kPrimaryColor,
//         ),
//       ),
//       activeTextStyle:
//       Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
//       inactiveTextStyle: Theme.of(context).textTheme.bodyLarge,
//     );
//   }
// }

// class LMShareButton extends LMTextView {
//   LMShareButton({
//     super.key,
//     ValueNotifier<bool>? rebuildShareButton,
//   })  : _rebuildShareButton = rebuildShareButton,
//         super(text: "Save");

//   final ValueNotifier<bool>? _rebuildShareButton;

//   @override
//   Widget build(BuildContext context) {
//     return LMTextView(
//       text: "",
//       valueNotifier: _rebuildShareButton,
//       leadingIcon: const LMIcon(
//         inactiveIcon: Icon(
//           Icons.share_outlined,
//         ),
//         activeIcon: Icon(
//           Icons.share,
//           color: kPrimaryColor,
//         ),
//       ),
//       activeTextStyle:
//        Theme.of(context).textTheme.bodyLarge!.copyWith(color: kPrimaryColor),
//       inactiveTextStyle: Theme.of(context).textTheme.bodyLarge,
//     );
//   }
// }
