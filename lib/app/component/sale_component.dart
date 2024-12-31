import 'package:atvandbuggy_sales_app/app/home/controller/sale_controller.dart';
import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SaleComponent extends StatelessWidget {
  const SaleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Consumer<SaleController>(builder: (context, sale, child) {
        return Container(
          width: double.infinity,
          height: 240.h,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: theme.yellowLight,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 0.5,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/balance.png',
                              height: 15,
                            ),
                            6.verticalSpace,
                            Text(
                              'Withdrawable Balance',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${sale.withDrawableBalance}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              'AED',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: theme.yellowLight,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 0.5,
                              )
                            ]),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/rafferal_network.png',
                              height: 15,
                            ),
                            6.verticalSpace,
                            Text(
                              'My Referral Network',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${sale.network}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: theme.yellowLight,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 0.5,
                        )
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/sales.png',
                                      height: 15,
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      'My Sales',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${sale.mySale}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      'AED',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/referral_sales.png',
                                      height: 15,
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      'Referral Sales',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${sale.referralSale}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      'AED',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      5.verticalSpace,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/sales.png',
                                height: 15,
                              ),
                              6.verticalSpace,
                              Text(
                                'Total Sales',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${sale.totalSale}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'AED',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
