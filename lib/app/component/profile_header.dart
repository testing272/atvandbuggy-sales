import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../setting/controller/user_data_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataController>(builder: (context, profile, child) {
      try {
        return Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(
                  '${profile.userDataModel.profileUrl}'),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${profile.userDataModel.name}',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text(
                  '${profile.userDataModel.email}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        );
      } catch (e) {
        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 15),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.white,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              10.horizontalSpace,
              Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.3),
                    highlightColor: Colors.white,
                    child: Container(
                      height: 10,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  10.verticalSpace,
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.3),
                    highlightColor: Colors.white,
                    child: Container(
                      height: 10,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    });
  }
}
