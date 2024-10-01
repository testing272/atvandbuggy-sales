import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/constant/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/asset_paths.dart';
import '../../component/custom_button.dart';
import '../../component/custom_text_field.dart';
import '../../navigator/view/navigation_screen.dart';

final _formKey = GlobalKey<FormState>();

class CreateYourAccountScreen extends StatefulWidget {
  final String referredById;
  const CreateYourAccountScreen({super.key, required this.referredById});

  @override
  State<CreateYourAccountScreen> createState() =>
      _CreateYourAccountScreenState();
}

class _CreateYourAccountScreenState extends State<CreateYourAccountScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Let’s get your account set up',
                  style:
                      TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w600),
                ),
                25.verticalSpace,
                CustomTextField(
                    validation: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter your first name';
                      }
                      if (RegExp(r'[1-9]').hasMatch(value)) {
                        return 'Name should not contain any number';
                      }
                      return null;
                    },
                    controller: firstNameController,
                    hint: 'First name'),
                25.verticalSpace,
                CustomTextField(
                    validation: (value) {
                      if (value.toString().isEmpty) {
                        return 'Please enter your last name';
                      }
                      if (RegExp(r'[1-9]').hasMatch(value)) {
                        return 'Name should not contain any number';
                      }
                      return null;
                    },
                    controller: lastNameController,
                    hint: 'Last name'),
                25.verticalSpace,
                CustomTextField(
                  controller: emailController,
                  hint: 'Email',
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
                25.verticalSpace,
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
                  validation: (value) {
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'password must contain uppercase';
                    }
                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'password must contain special character';
                    }
                    return null;
                  },
                ),
                25.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: 'By continuing, you agree to Sales App ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
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
                ),
                100.verticalSpace,
                CustomButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showLoader(context);
                        final response = await AuthController()
                            .createUserWithEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                firstNameController.text,
                                lastNameController.text,
                                widget.referredById,
                                context);
                        if (response != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NavigationScreen();
                          }));
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    title: 'Create my account'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
