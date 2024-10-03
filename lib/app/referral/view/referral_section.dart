import 'package:atvandbuggy_sales_app/app/referral/controller/your_referrals_controller.dart';
import 'package:atvandbuggy_sales_app/app/referral/model/referral_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../chat/view/chat_screen.dart';

class ReferralSection extends StatefulWidget {
  const ReferralSection({super.key});

  @override
  State<ReferralSection> createState() => _ReferralSectionState();
}

class _ReferralSectionState extends State<ReferralSection> {
  String? expandedId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getReferrals();
    });
  }

  getReferrals() async {
    Provider.of<YourReferralsController>(context, listen: false)
        .fetchReferralUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<YourReferralsController>(
        builder: (context, referralController, child) {
      if (referralController.referrals == null) {
        return Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.3),
                  highlightColor: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                  ),
                );
              }),
        );
      }
      List<ReferralModel> referrals = referralController.referrals!;
      if (referrals.length <= 0) {
        return Text(
          'You currently don\'t have any referral users. Share your referral link with friends and start building your network today!',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
            itemCount: referrals.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.withOpacity(0.4))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    referrals[index].profilePicture),
                              ),
                              20.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Total Sales',
                                                    style: TextStyle(
                                                        fontSize: 6,
                                                        color:
                                                            Color(0xffADADAD),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    '${referrals[index].totalSales} AED',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                              ),
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                            ),
                                            10.horizontalSpace,
                                            Container(
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Total Referral',
                                                    style: TextStyle(
                                                        fontSize: 6,
                                                        color:
                                                            Color(0xffADADAD),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    '${referrals[index].referralCount}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 9),
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                              ),
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.symmetric(
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
                                  if (expandedId != referrals[index].email) {
                                    expandedId = referrals[index].email;
                                  } else {
                                    expandedId = null;
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: expandedId == referrals[index].email
                                        ? null
                                        : Color(0xffE4E4E4),
                                    borderRadius: BorderRadius.circular(4)),
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
                                            '${referrals[index].referralCount}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff979797)),
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
                                  mainAxisAlignment:
                                      expandedId == referrals[index].email
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.center,
                                ),
                                height: 60,
                                width: 90,
                              ),
                            ),
                            expandedId == referrals[index].email
                                ? InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Image.asset(
                                        'assets/icons/message.png',
                                        height: 20,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ChatScreen(
                                          name: referrals[index].name,
                                          profileUrl:
                                              referrals[index].profilePicture,
                                        );
                                      }));
                                    },
                                  )
                                : SizedBox.shrink()
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    expandedId == referrals[index].email &&
                            referrals[index].network != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.grey.withOpacity(0.3),
                                  height: 0,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: referrals[index].network!.length,
                                    itemBuilder: (context, networkIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 70),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 1,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                            ),
                                            Container(
                                              height: 0.5,
                                              width: 30,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              margin: EdgeInsets.only(right: 5),
                                            ),
                                            CircleAvatar(
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                      referrals[index]
                                                          .network![
                                                              networkIndex]
                                                          .profilePicture),
                                              radius: 14,
                                            ),
                                            15.horizontalSpace,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  referrals[index].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 8),
                                                ),
                                                Text(
                                                  referrals[index].email,
                                                  style: TextStyle(
                                                      fontSize: 7,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey),
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
      );
    });
  }
}
