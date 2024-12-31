import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReferralListShimmer extends StatelessWidget {
  const ReferralListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.1),
            highlightColor: Colors.white,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
          );
        });
  }
}
