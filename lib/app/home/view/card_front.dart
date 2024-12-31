import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

Widget cardFront() {
  return Card(
    elevation: 3,
    shadowColor: Colors.white,
    child: Consumer<UserDataController>(builder: (context, profile, child) {
      try {
        return Container(
          height: 150,
          width: 280,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/influencer_card.png',
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              10.verticalSpace,
              QrImageView(
                padding: EdgeInsets.all(5),
                backgroundColor: Colors.white,
                data:
                    'https://dev-v2.atvandbuggy.com/?q=${profile.userDataModel.referredCode}',
                size: 80,
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'www.atvandbuggy.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        );
      } catch (e) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.white,
          child: Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
          ),
        );
      }
    }),
  );
}
