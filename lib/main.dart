import 'package:atvandbuggy_sales_app/app/home/controller/sale_controller.dart';
import 'package:atvandbuggy_sales_app/app/referral/controller/refer_by_controller.dart';
import 'package:atvandbuggy_sales_app/app/referral/controller/your_referrals_controller.dart';
import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app/setting/controller/language_controller.dart';
import 'app/splash/view/splash_screen.dart';
import 'constant/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppTheme()),
    ChangeNotifierProvider(create: (context) => LanguageChangeController()),
    ChangeNotifierProvider(create: (context) => UserDataController()),
    ChangeNotifierProvider(create: (context) => ReferByController()),
    ChangeNotifierProvider(create: (context) => SaleController()),
    ChangeNotifierProvider(create: (context) => YourReferralsController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final Locale appLocale =
          Provider.of<LanguageChangeController>(context).appLocale ??
              const Locale('en');
      final TextDirection textDirection = appLocale.languageCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr;
      return ScreenUtilInit(
          designSize: Size(MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height),
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: atvAndBuggySales,
              theme: AppTheme.lightTheme,
              home: Directionality(
                textDirection: textDirection,
                child: const SplashScreen(),
              ),
            );
          });
    });
  }
}
