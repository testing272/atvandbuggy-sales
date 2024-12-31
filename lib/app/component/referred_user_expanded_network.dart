import 'package:atvandbuggy_sales_app/app/component/referral_list_shimmer.dart';
import 'package:atvandbuggy_sales_app/app/component/referred_network_user_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../referral/controller/your_referrals_controller.dart';

class ReferredUserExpandedNetwork extends StatefulWidget {
  final String uid;
  final int userIndex;
  ReferredUserExpandedNetwork(
      {super.key, required this.uid, required this.userIndex});

  @override
  State<ReferredUserExpandedNetwork> createState() =>
      _ReferredUserExpandedNetworkState();
}

class _ReferredUserExpandedNetworkState
    extends State<ReferredUserExpandedNetwork> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getReferrals();
    });
  }

  getReferrals() async {
    await Provider.of<YourReferralsController>(context, listen: false)
        .fetchReferralNetwork(widget.uid, widget.userIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<YourReferralsController>(
        builder: (context, referralController, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Column(
          children: [
            Divider(
              color: Colors.grey.withOpacity(0.3),
              height: 0,
            ),
            referralController.referrals![widget.userIndex].network != null
                ? referralController
                            .referrals![widget.userIndex].network!.length <=
                        0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          'This user hasn\'t referred anyone yet.',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: referralController
                            .referrals![widget.userIndex].network!.length,
                        itemBuilder: (context, networkIndex) {
                          return ReferredNetworkUserComponent(
                              referralModel: referralController
                                  .referrals![widget.userIndex]
                                  .network![networkIndex]);
                        })
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: ReferralListShimmer(),
                  ),
          ],
        ),
      );
    });
  }
}
