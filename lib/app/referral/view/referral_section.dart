import 'package:atvandbuggy_sales_app/app/component/referral_list_shimmer.dart';
import 'package:atvandbuggy_sales_app/app/component/referral_not_found.dart';
import 'package:atvandbuggy_sales_app/app/component/referred_user_component.dart';
import 'package:atvandbuggy_sales_app/app/referral/controller/your_referrals_controller.dart';
import 'package:atvandbuggy_sales_app/app/referral/model/referral_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        return ReferralListShimmer();
      }
      List<ReferralModel> referrals = referralController.referrals!;
      if (referrals.length <= 0) {
        return ReferralNotFound();
      }
      return Expanded(
        child: ListView.builder(
            itemCount: referrals.length,
            itemBuilder: (context, index) {
              return ReferredUserComponent(
                userIndex: index,
                referralModel: referrals[index],
                expandedId: expandedId,
                onExpand: () {
                  setState(() {
                    if (expandedId != referrals[index].email) {
                      expandedId = referrals[index].email;
                    } else {
                      expandedId = null;
                    }
                  });
                },
              );
            }),
      );
    });
  }
}
