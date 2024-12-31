import 'package:atvandbuggy_sales_app/app/referral/model/referral_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferredNetworkUserComponent extends StatelessWidget {
  final ReferralModel referralModel;
  const ReferredNetworkUserComponent({super.key, required this.referralModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          Container(
            height: 0.5,
            width: 30,
            color: Colors.grey.withOpacity(0.3),
            margin: EdgeInsets.only(right: 5),
          ),
          CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider(referralModel.profilePicture),
            radius: 14,
          ),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                referralModel.name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 8),
              ),
              Text(
                referralModel.email,
                style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
