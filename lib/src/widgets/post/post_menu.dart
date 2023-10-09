import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';

class LMPostMenu extends StatelessWidget {
  const LMPostMenu({
    super.key,
    this.children,
    required this.menuItems,
    required this.isFeed,
    required this.onSelected,
    this.menuIcon,
    this.removeItemIds = const {4, 7},
  });

  final Map<int, LMTextView>? children;
  final LMIcon? menuIcon;
  final List<PopupMenuItemModel> menuItems;
  final bool isFeed;
  final Function(int)? onSelected;
  final Set<int> removeItemIds;

  void removeReportIntegration() {
    menuItems.removeWhere((element) {
      return removeItemIds.contains(element.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    removeReportIntegration();
    return Builder(
      builder: (context) {
        if (menuItems.isEmpty) {
          return Container();
        }
        return SizedBox(
          child: Builder(builder: (context) {
            return PopupMenuButton<int>(
              onSelected: onSelected,
              itemBuilder: (context) => menuItems
                  .map(
                    (element) => PopupMenuItem(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      height: 48,
                      value: element.id,
                      child: children?[element.id] ??
                          LMTextView(
                            text: element.title,
                            textStyle: const TextStyle(
                              color: kGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    ),
                  )
                  .toList(),
              color: kWhiteColor,
              child: menuIcon ??
                  const SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(
                      Icons.more_horiz,
                      color: kGrey1Color,
                      size: 24,
                    ),
                  ),
            );
          }),
        );
      },
    );
  }
}
