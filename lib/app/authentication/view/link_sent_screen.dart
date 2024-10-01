import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../component/custom_button.dart';

class ForgotPasswordLinkScreen extends StatelessWidget {
  final String email;
  const ForgotPasswordLinkScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            changePassword,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Image.asset(
                    'assets/icons/email_sent.png',
                  ),
                ),
                70.verticalSpace,
                Text(
                  'We have sent you the Forgot password link to your email $email',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                50.verticalSpace,
                CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  title: 'Go Back',
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
