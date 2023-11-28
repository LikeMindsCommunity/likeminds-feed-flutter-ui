import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:shimmer/shimmer.dart';

class LMFeedShimmer extends StatelessWidget {
  const LMFeedShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: const Color.fromARGB(255, 111, 111, 115),
      period: const Duration(milliseconds: 1000),
      child: SizedBox(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      kHorizontalPaddingLarge,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kVerticalPaddingMedium,
                            Container(
                              height: 18,
                              width: 226,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            kVerticalPaddingMedium,
                            Container(
                              width: 170,
                              height: 14,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),
              kVerticalPaddingLarge,
              Container(
                width: screenSize.width,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingSmall,
              Container(
                width: screenSize.width,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingSmall,
              Container(
                width: 250,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingLarge,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingXSmall,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingXSmall,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingMedium,
                    Container(
                      width: 55,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 112,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width,
                height: 2,
                margin: const EdgeInsets.symmetric(vertical: 18.0),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      kHorizontalPaddingLarge,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kVerticalPaddingMedium,
                            Container(
                              height: 18,
                              width: 226,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            kVerticalPaddingMedium,
                            Container(
                              width: 170,
                              height: 14,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),
              kVerticalPaddingLarge,
              Container(
                width: screenSize.width,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingSmall,
              Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              kVerticalPaddingLarge,
              Container(
                height: 160,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                ),
              ),
              kVerticalPaddingLarge,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingXSmall,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingXSmall,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kWhiteColor),
                    ),
                    kHorizontalPaddingMedium,
                    Container(
                      width: 55,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 112,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width,
                height: 2,
                margin: const EdgeInsets.symmetric(vertical: 18.0),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      kHorizontalPaddingLarge,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kVerticalPaddingMedium,
                            Container(
                              height: 18,
                              width: 226,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            kVerticalPaddingMedium,
                            Container(
                              width: 170,
                              height: 14,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: kWhiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),
              kVerticalPaddingLarge,
              Container(
                width: screenSize.width,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingSmall,
              Container(
                width: screenSize.width,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingSmall,
              Container(
                width: 250,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 16,
                decoration: ShapeDecoration(
                  color: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              kVerticalPaddingLarge,
            ],
          )),
    );
  }
}
