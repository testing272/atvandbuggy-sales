import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/app/navigator/view/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/view/login_screen.dart';
import '../../onboarding/view/onboarding_screen.dart';

class SplashScreenController {
  navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    bool isFirstTime = await isOnboarded();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return isFirstTime
          ? const OnboardingScreen()
          : AuthController().isUserLoggedIn()
              ? NavigationScreen()
              : const LoginScreen();
    }));
  }

  Future<bool> isOnboarded() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isFirstTime = preferences.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  Future<void> onboarded() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isFirstTime', false);
  }
}
