import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'By continuing, you agree to Sales App ',
        style: TextStyle(
            color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Terms & Conditions tap
                print('Terms & Conditions tapped');
              },
          ),
          TextSpan(
            text: ' and ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Privacy Policy tap
                print('Privacy Policy tapped');
              },
          ),
          TextSpan(
            text: '.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
