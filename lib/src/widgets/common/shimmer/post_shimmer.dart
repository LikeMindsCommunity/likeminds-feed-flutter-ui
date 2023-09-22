import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LMPostShimmer extends StatelessWidget {
  const LMPostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        color: Colors.white,
        width: screenSize.width,
        height: screenSize.width,
      ),
    );
  }
}
