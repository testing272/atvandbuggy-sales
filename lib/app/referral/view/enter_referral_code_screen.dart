import 'package:atvandbuggy_sales_app/app/referral/controller/refer_by_controller.dart';
import 'package:atvandbuggy_sales_app/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../authentication/view/create_your_account_screen.dart';
import '../../component/custom_button.dart';
import '../../component/custom_text_field.dart';

final _formKey = GlobalKey<FormState>();

class EnterReferralCodeScreen extends StatefulWidget {
  const EnterReferralCodeScreen({super.key});

  @override
  State<EnterReferralCodeScreen> createState() =>
      _EnterReferralCodeScreenState();
}

class _EnterReferralCodeScreenState extends State<EnterReferralCodeScreen> {
  TextEditingController referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the Referral\nCode',
                style: TextStyle(fontSize: 38.sp, fontWeight: FontWeight.w800),
              ),
              40.verticalSpace,
              CustomTextField(
                controller: referralCodeController,
                hint: referralCode,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a referral code';
                  } else {
                    return null;
                  }
                },
              ),
              30.verticalSpace,
              CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      showLoader(context);
                      final bool response = await ReferByController()
                          .idValidReferralCode(referralCodeController.text);
                      if (response) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return CreateYourAccountScreen(
                            referredById: referralCodeController.text,
                          );
                        }));
                      } else {
                        Navigator.pop(context);
                        showCustomToast(
                            context, 'Invalid referral code, please try again');
                      }
                    }
                  },
                  title: continueText),
            ],
          ),
        ),
      ),
    );
  }
}
