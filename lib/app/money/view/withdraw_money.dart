import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/custom_button.dart';

class WithdrawMoney extends StatelessWidget {
  const WithdrawMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                'Withdraw Money',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              15.verticalSpace,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffECECEC),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.only(top: 30, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff888888)),
                    ),
                    Text(
                      '600.00 AED',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 35),
                    ),
                    40.verticalSpace,
                    Text(
                      '350.12 AED',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color(0xff888888),
                      ),
                    ),
                    Text(
                      'Available balance',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff888888),
                      ),
                    ),
                  ],
                ),
              ),
              25.verticalSpace,
              Row(
                children: [
                  Text(
                    'Withdraw Money to',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              15.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/bank.png',
                      height: 20,
                    ),
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Primary Bank Account',
                          style: TextStyle(fontSize: 10),
                        ),
                        5.verticalSpace,
                        Text(
                          '**** **** **** 4242',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              25.verticalSpace,
              CustomButton(
                includeBorder: true,
                onTap: () {},
                title: 'Add bank',
                includeOpacity: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
