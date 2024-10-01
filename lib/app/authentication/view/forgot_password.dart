import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/constants.dart';
import '../../../theme/app_theme.dart';
import '../../component/custom_button.dart';
import '../../component/custom_text_field.dart';
import '../controller/auth_controller.dart';
import 'link_sent_screen.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            changePassword,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpace,
                CustomTextField(
                  validation: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value) || value.isEmpty)
                      return 'Enter a valid email address';
                    else
                      return null;
                  },
                  hint: enterYourEmail,
                  controller: emailController,
                ),
                50.verticalSpace,
                CustomButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoader(context);
                        final status = await AuthController()
                            .sendPasswordResetEmail(
                                emailController.text, context);
                        if (status) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordLinkScreen(
                              email: emailController.text,
                            );
                          }));
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    title: getLink),
              ],
            ),
          ),
        ),
      );
    });
  }
}
