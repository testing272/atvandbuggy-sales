import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/asset_paths.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashScreenController();
    _controller.navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              appLogoPath,
              height: 100.h, // Responsive height using ScreenUtil
              fit: BoxFit.contain,
            ),
            SizedBox(height: 15.h), // Responsive vertical space
            // App Name Text
            Text(
              salesApp,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27.sp, // Responsive font size
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
