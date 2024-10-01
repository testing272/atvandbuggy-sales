import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../theme/app_theme.dart';
import 'custom_button.dart';

class CustomInvitationLink extends StatelessWidget {
  const CustomInvitationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 260.h),
        width: double.infinity,
        height: 230.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ], borderRadius: BorderRadius.circular(16), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your custom invitation link',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffE7EAEE),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'https://www.atvandbuggy.com/referal/',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'JUDYGMVAW',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                    child: Text(
                      'Copy',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            CustomButton(onTap: () {}, title: 'Share'),
          ],
        ),
      );
    });
  }
}
