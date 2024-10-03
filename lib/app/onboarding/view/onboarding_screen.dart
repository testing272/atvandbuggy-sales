import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/asset_paths.dart';
import '../../../theme/app_theme.dart';
import '../../authentication/view/login_screen.dart';
import '../../component/custom_button.dart';
import '../../splash/controller/splash_screen_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: PageView.builder(
            itemCount: onboardingScreensImages.length,
            onPageChanged: (val) {
              setState(() {
                selectedIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 400.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                onboardingScreensImages[index]['asset']),
                            fit: BoxFit.cover)),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onboardingScreensImages[index]['title'],
                              style: TextStyle(
                                  fontSize: 27.sp, fontWeight: FontWeight.w800),
                            ),
                            20.verticalSpace,
                            Text(
                              onboardingScreensImages[index]['body'],
                            ),
                            100.verticalSpace,
                            Align(
                              alignment: Alignment.center,
                              child: Wrap(
                                children: List.generate(
                                    onboardingScreensImages.length, (index) {
                                  return Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedIndex == index
                                            ? theme.primaryColor
                                            : theme.primaryColor
                                                .withOpacity(0.35)),
                                  );
                                }),
                              ),
                            ),
                            20.verticalSpace,
                            CustomButton(
                                onTap: () {
                                  SplashScreenController().onboarded();
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));
                                },
                                title: getStarted),
                            30.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      );
    });
  }
}
