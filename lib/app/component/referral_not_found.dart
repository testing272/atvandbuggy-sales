import 'package:flutter/material.dart';

class ReferralNotFound extends StatelessWidget {
  const ReferralNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'You currently don\'t have any referral users. Share your referral link with friends and start building your network today!',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
