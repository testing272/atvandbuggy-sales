import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/app/navigator/view/navigation_screen.dart';
import 'package:atvandbuggy_sales_app/app/referral/view/enter_referral_code_screen.dart';
import 'package:atvandbuggy_sales_app/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/asset_paths.dart';
import '../../../theme/app_theme.dart';
import '../../component/custom_button.dart';
import '../../component/custom_text_field.dart';
import 'forgot_password.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      signInToYourAccount,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 38.sp),
                    ),
                    30.verticalSpace,
                    CustomTextField(
                      controller: emailController,
                      hint: enterYourEmail,
                      validation: (value) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,6})$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value) || value.isEmpty) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    20.verticalSpace,
                    CustomTextField(
                      controller: passwordController,
                      hint: enterYourPassword,
                      obscureText: obscureText,
                      suffixIconPath: obscureText ? eyeClosePath : eyeOpenPath,
                      tapOnObscureText: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    25.verticalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgotPassword();
                        }));
                      },
                      child: Text(
                        forgotPassword,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    35.verticalSpace,
                    CustomButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            showLoader(context);
                            final response = await AuthController()
                                .signInUserWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text,
                                    context);
                            if (response != null) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return NavigationScreen();
                              }));
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        title: continueText),
                    30.verticalSpace,
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EnterReferralCodeScreen();
                          }));
                        },
                        child: Text(
                          continueWithReferralLink,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
