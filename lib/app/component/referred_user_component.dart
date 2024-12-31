import 'package:atvandbuggy_sales_app/app/component/referred_user_expanded_network.dart';
import 'package:atvandbuggy_sales_app/app/referral/model/referral_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../chat/view/chat_screen.dart';

class ReferredUserComponent extends StatelessWidget {
  final ReferralModel referralModel;
  final String? expandedId;
  final VoidCallback onExpand;
  final int userIndex;
  const ReferredUserComponent(
      {super.key,
      required this.userIndex,
      required this.referralModel,
      required this.expandedId,
      required this.onExpand});

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          referralModel.profilePicture),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          referralModel.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(
                          referralModel.email,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        expandedId == referralModel.email
                            ? Row(
                                children: [
                                  Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Total Sales',
                                          style: TextStyle(
                                              fontSize: 6,
                                              color: Color(0xffADADAD),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '${referralModel.totalSales} AED',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 9),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  10.horizontalSpace,
                                  Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Total Referral',
                                          style: TextStyle(
                                              fontSize: 6,
                                              color: Color(0xffADADAD),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '${referralModel.referralCount}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 9),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.symmetric(vertical: 5),
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
                    onTap: onExpand,
                    child: Container(
                      decoration: BoxDecoration(
                          color: expandedId == referralModel.email
                              ? null
                              : Color(0xffE4E4E4),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          expandedId == referralModel.email
                              ? SizedBox.shrink()
                              : Image.asset(
                                  'assets/icons/user.png',
                                  height: 18,
                                ),
                          7.horizontalSpace,
                          expandedId == referralModel.email
                              ? SizedBox.shrink()
                              : Text(
                                  '${referralModel.referralCount}',
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
                          expandedId == referralModel.email
                              ? 10.horizontalSpace
                              : SizedBox.shrink(),
                        ],
                        mainAxisAlignment: expandedId == referralModel.email
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.center,
                      ),
                      height: 60,
                      width: 90,
                    ),
                  ),
                  expandedId == referralModel.email
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
                                name: referralModel.name,
                                profileUrl: referralModel.profilePicture,
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
          expandedId == referralModel.email
              ? ReferredUserExpandedNetwork(
                  uid: referralModel.uid,
                  userIndex: userIndex,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
