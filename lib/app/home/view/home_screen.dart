import 'package:atvandbuggy_sales_app/app/component/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constant/app_strings.dart';
import '../../../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ProfileHeader(),
                  20.verticalSpace,
                  Text(
                    'Feb 2024 -  May 2024',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        color: Color(0xff622E9D)),
                  ),
                  5.verticalSpace,
                  Container(
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '8,590.00',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        'AED',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '25',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/sales.png',
                                                height: 15,
                                              ),
                                              6.verticalSpace,
                                              Text(
                                                'My Sales',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '520',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                'AED',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/referral_sales.png',
                                                height: 15,
                                              ),
                                              6.verticalSpace,
                                              Text(
                                                'Referral Sales',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '15000',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                'AED',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/sales.png',
                                          height: 15,
                                        ),
                                        6.verticalSpace,
                                        Text(
                                          'Total Sales',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '15,520.00',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          'AED',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
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
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Text(
                          'Share your Card',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/icons/share.png',
                          height: 26,
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        itemCount: cardBg.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.asset(
                                cardBg[index],
                              ),
                              index == 0
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(width: double.infinity),
                                        QrImageView(
                                          data:
                                              'csdsjkdjkkjsdsjkd23r3r89dsdkjdsjkjkdbdb3348834jnbcdsnjsdcjn34skjfksdkfjsif3489rewjkf',
                                          version: QrVersions.auto,
                                          size: 90.0,
                                          foregroundColor: Colors.white,
                                        ),
                                        10.verticalSpace,
                                        Text(
                                          'www.atvandbuggy.com',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  : SizedBox(),
                            ],
                          );
                        }),
                  ),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(cardBg.length, (index) {
                      return Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? theme.primaryColor
                                : Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle),
                      );
                    }),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
