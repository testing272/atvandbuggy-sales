import 'package:atvandbuggy_sales_app/app/component/referral_balance_header.dart';
import 'package:atvandbuggy_sales_app/app/referral/view/referral_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralsScreen extends StatefulWidget {
  const ReferralsScreen({super.key});

  @override
  State<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReferralBalanceHeader(),
              20.verticalSpace,
              Text(
                'Your referrals',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              10.verticalSpace,
              ReferralSection(),
            ],
          ),
        ),
      ),
    );
  }
}
