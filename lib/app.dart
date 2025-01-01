import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/home/controller/sale_controller.dart';
import 'app/referral/controller/refer_by_controller.dart';
import 'app/referral/controller/your_referrals_controller.dart';
import 'app/setting/controller/language_controller.dart';
import 'app/setting/controller/user_data_controller.dart';
import 'app/splash/view/splash_screen.dart';
import 'constant/app_strings.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppTheme()),
        ChangeNotifierProvider(create: (_) => LanguageChangeController()),
        ChangeNotifierProvider(create: (_) => UserDataController()),
        ChangeNotifierProvider(create: (_) => ReferByController()),
        ChangeNotifierProvider(create: (_) => SaleController()),
        ChangeNotifierProvider(create: (_) => YourReferralsController()),
      ],
      child: Builder(
        builder: (context) {
          final Locale appLocale =
              Provider.of<LanguageChangeController>(context).appLocale ??
                  const Locale('en');
          final TextDirection textDirection = appLocale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr;

          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: atvAndBuggySales,
              theme: AppTheme.lightTheme,
              home: Directionality(
                textDirection: textDirection,
                child: const SplashScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
