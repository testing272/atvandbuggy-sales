import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_theme.dart';
import '../../component/custom_invitation_link.dart';

class ReferYourFriend extends StatelessWidget {
  const ReferYourFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 320.h,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Refer your Friend\nand Earn',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                CustomInvitationLink()
              ],
            ),
          ],
        ),
      );
    });
  }
}
