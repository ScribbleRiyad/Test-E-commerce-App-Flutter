import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../Utils/theme_styles.dart';

class ShimmerPageLoading extends StatelessWidget {
  const ShimmerPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Shimmer.fromColors(
        baseColor: ThemeStyles.primary.withOpacity(0.5),
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 800), // Duration of one cycle of the shimmer animation
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildShimmerBox(width: 150, height: 200),
                const SizedBox(width: 10),
                _buildShimmerBox(width: 150, height: 200),

              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildShimmerBox(width: 150, height: 200),
                const SizedBox(width: 10),
                _buildShimmerBox(width: 150, height: 200),

              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildShimmerBox(width: 150, height: 200),
                const SizedBox(width: 10),
                _buildShimmerBox(width: 150, height: 200),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor:  ThemeStyles.primary.withOpacity(0.5),
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 800), // Duration of one cycle of the shimmer animation
        direction: ShimmerDirection.ltr, // Animation direction: left-to-right
        child:Card(
          elevation: 3,
          shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  15),

            ),
          ),
        ),
      ),
    );
  }
}
