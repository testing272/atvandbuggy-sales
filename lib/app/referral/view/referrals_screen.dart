import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/referral_model.dart';

class ReferralsScreen extends StatefulWidget {
  const ReferralsScreen({super.key});

  @override
  State<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  String? expandedId;
  List<ReferralModel> referrals = [
    ReferralModel(
        email: 'darlene.robertson@gmail.com',
        name: 'Darlene Robertson',
        network: [
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 5,
              profilePicture: 'assets/icons/person.png'),
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 15,
              profilePicture: 'assets/icons/person.png'),
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 0,
              profilePicture: 'assets/icons/person.png'),
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 11,
              profilePicture: 'assets/icons/person.png'),
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 12,
              profilePicture: 'assets/icons/person.png'),
          ReferralModel(
              email: 'darlene.robertson@gmail.com',
              name: 'Darlene Robertson',
              network: [],
              referralCount: 17,
              profilePicture: 'assets/icons/person.png'),
        ],
        referralCount: 5,
        profilePicture: 'assets/icons/person.png'),
    ReferralModel(
        email: 'tanya.hill@example.com',
        name: 'Tanya',
        network: [],
        referralCount: 15,
        profilePicture: 'assets/icons/person.png'),
    ReferralModel(
        email: 'jessica@gmail.com',
        name: 'jessica',
        network: [],
        referralCount: 0,
        profilePicture: 'assets/icons/person.png'),
    ReferralModel(
        email: 'kenzi@gmail.com',
        name: 'kenzi',
        network: [],
        referralCount: 11,
        profilePicture: 'assets/icons/person.png'),
    ReferralModel(
        email: 'amsa@gmail.com',
        name: 'Amsa',
        network: [],
        referralCount: 12,
        profilePicture: 'assets/icons/person.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 235.h,
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/icons/rehan.png'),
                              ),
                              10.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rehan Khan',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    'rehan.rky@gmail.com',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/level/bronze.png',
                          height: 90,
                        ),
                        20.horizontalSpace,
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  color: Color(0xffDEDEDE),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Balance',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    '650.00',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    'AED',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  color: Color(0xffDEDEDE),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Referral Balance',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    '500.00',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    'AED',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  color: Color(0xffDEDEDE),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Total Referrals',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  15.verticalSpace,
                                  Text(
                                    '50',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Text(
                'Your referrals',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              10.verticalSpace,
              Expanded(
                child: ListView.builder(
                    itemCount: referrals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.4))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            referrals[index].profilePicture),
                                      ),
                                      20.horizontalSpace,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            referrals[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            referrals[index].email,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                          ),
                                          expandedId == referrals[index].email
                                              ? Row(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Total Sales',
                                                            style: TextStyle(
                                                                fontSize: 6,
                                                                color: Color(
                                                                    0xffADADAD),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            '50 AED',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 9),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                    ),
                                                    10.horizontalSpace,
                                                    Container(
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Total Referral',
                                                            style: TextStyle(
                                                                fontSize: 6,
                                                                color: Color(
                                                                    0xffADADAD),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            '5',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 9),
                                                          ),
                                                        ],
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                    )
                                                  ],
                                                )
                                              : SizedBox.shrink(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (expandedId !=
                                              referrals[index].email) {
                                            expandedId = referrals[index].email;
                                          } else {
                                            expandedId = null;
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: expandedId ==
                                                    referrals[index].email
                                                ? null
                                                : Color(0xffE4E4E4),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            expandedId == referrals[index].email
                                                ? SizedBox.shrink()
                                                : Image.asset(
                                                    'assets/icons/user.png',
                                                    height: 18,
                                                  ),
                                            7.horizontalSpace,
                                            expandedId == referrals[index].email
                                                ? SizedBox.shrink()
                                                : Text(
                                                    referrals[index]
                                                        .referralCount
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color:
                                                            Color(0xff979797)),
                                                  ),
                                            7.horizontalSpace,
                                            Image.asset(
                                              'assets/icons/drop_down.png',
                                              height: 7,
                                            ),
                                            expandedId == referrals[index].email
                                                ? 10.horizontalSpace
                                                : SizedBox.shrink(),
                                          ],
                                          mainAxisAlignment: expandedId ==
                                                  referrals[index].email
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.center,
                                        ),
                                        height: 60,
                                        width: 90,
                                      ),
                                    ),
                                    expandedId == referrals[index].email
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Image.asset(
                                              'assets/icons/message.png',
                                              height: 20,
                                            ),
                                          )
                                        : SizedBox.shrink()
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                              ],
                            ),
                            expandedId == referrals[index].email
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 10),
                                    child: Column(
                                      children: [
                                        Divider(
                                          color: Colors.grey.withOpacity(0.3),
                                          height: 0,
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount:
                                                referrals[index].network.length,
                                            itemBuilder:
                                                (context, networkIndex) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(left: 70),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 1,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                    ),
                                                    Container(
                                                      height: 0.5,
                                                      width: 30,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(referrals[
                                                                  index]
                                                              .profilePicture),
                                                      radius: 14,
                                                    ),
                                                    15.horizontalSpace,
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          referrals[index].name,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 8),
                                                        ),
                                                        Text(
                                                          referrals[index]
                                                              .email,
                                                          style: TextStyle(
                                                              fontSize: 7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
