import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/app/referral/model/referral_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class YourReferralsController extends ChangeNotifier {
  List<ReferralModel>? referrals;

  Future<void> fetchReferralUsers() async {
    try {
      //Reset the list
      referrals = [];
      // Reference to the network sub-collection for the influencer
      final networkRef = FirebaseFirestore.instance
          .collection('Influencer')
          .doc(AuthController().getUid())
          .collection('network');

      // Get the list of referred users from the network subcollection
      final networkSnapshot = await networkRef.get();

      // Iterate over each referred user's UID
      for (var doc in networkSnapshot.docs) {
        String referredUserUid = doc['user_uid'];
        print(referredUserUid);
        // Fetch the referred user's details from the Influencer collection
        final referredUserDoc = await FirebaseFirestore.instance
            .collection('Influencer')
            .doc(referredUserUid)
            .get();

        // Check if the referred user's data exists
        if (referredUserDoc.exists) {
          var referredUserData = referredUserDoc.data() as Map<String, dynamic>;

          // // Recursive call to fetch the referred user's network (if needed)
          // List<ReferralModel> referredUserNetwork =
          //     await fetchReferralNetwork(referredUserUid);

          // Convert the Firestore document data to a ReferralModel using the factory constructor
          ReferralModel referral = ReferralModel.fromFirebase(
            referredUserData,
            network: null,
          );

          // Add the referral to the list
          referrals!.add(referral);
        }
      }

      // Notify listeners that the list has been updated
      notifyListeners();
    } catch (e) {
      print("Error fetching referral users: $e");
    }
  }

  // Recursive function to fetch the referred user's network
  Future<List<ReferralModel>> fetchReferralNetwork(String influencerUid) async {
    List<ReferralModel> referralNetwork = [];

    try {
      // Reference to the network subcollection for the influencer
      final networkRef = FirebaseFirestore.instance
          .collection('Influencer')
          .doc(influencerUid)
          .collection('network');

      // Get the list of referred users from the network subcollection
      final networkSnapshot = await networkRef.get();

      // Iterate over each referred user's UID
      for (var doc in networkSnapshot.docs) {
        String referredUserUid = doc['user_uid'];

        // Fetch the referred user's details from the Influencer collection
        final referredUserDoc = await FirebaseFirestore.instance
            .collection('Influencer')
            .doc(referredUserUid)
            .get();

        // Check if the referred user's data exists
        if (referredUserDoc.exists) {
          var referredUserData = referredUserDoc.data() as Map<String, dynamic>;

          // Recursive call to fetch the referred user's network
          List<ReferralModel> referredUserNetwork =
              await fetchReferralNetwork(referredUserUid);

          // Convert the Firestore document data to a ReferralModel using the factory constructor
          ReferralModel referral = ReferralModel.fromFirebase(
            referredUserData,
            network: referredUserNetwork,
          );

          // Add the referral to the referral network list
          referralNetwork.add(referral);
        }
      }
    } catch (e) {
      print("Error fetching referral network: $e");
    }

    return referralNetwork;
  }
}
