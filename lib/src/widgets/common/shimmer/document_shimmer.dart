import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class LMDocumentShimmer extends StatelessWidget {
  const LMDocumentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: kGreyWebBGColor),
          borderRadius: BorderRadius.circular(kBorderRadiusMedium)),
      padding: const EdgeInsets.all(kPaddingLarge),
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Row(children: <Widget>[
          Container(
            height: 40,
            width: 35,
            color: kWhiteColor,
          ),
          kHorizontalPaddingLarge,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8,
                width: 150,
                color: kWhiteColor,
              ),
              kVerticalPaddingMedium,
              Row(
                children: <Widget>[
                  Container(
                    height: 6,
                    width: 50,
                    color: kWhiteColor,
                  ),
                  kHorizontalPaddingXSmall,
                  const Text(
                    '·',
                    style: TextStyle(fontSize: kFontSmall, color: kGrey3Color),
                  ),
                  kHorizontalPaddingXSmall,
                  Container(
                    height: 6,
                    width: 50,
                    color: kWhiteColor,
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
