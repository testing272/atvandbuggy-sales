import 'package:atvandbuggy_sales_app/app/component/profile_header.dart';
import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReferralBalanceHeader extends StatelessWidget {
  const ReferralBalanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataController>(builder: (context, profile, child) {
      return Container(
        height: 235.h,
        decoration: BoxDecoration(
            color: Color(0xffF4F4F4), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: ProfileHeader(),
                ),
                Spacer(),
                Image.asset(
                  'assets/level/${profile.userDataModel.level}.png',
                  height: 90,
                ),
                20.horizontalSpace,
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'My Sale',
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
                          ),
                          10.verticalSpace,
                          Text(
                            '${profile.userDataModel.mySale}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'AED',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Referral Sale',
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
                          ),
                          10.verticalSpace,
                          Text(
                            '${profile.userDataModel.referralSale}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'AED',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Total Referrals',
                            style: TextStyle(
                                fontSize: 9, fontWeight: FontWeight.w600),
                          ),
                          15.verticalSpace,
                          Text(
                            '${profile.userDataModel.referralNetwork}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
