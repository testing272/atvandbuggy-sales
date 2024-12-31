import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SaleController extends ChangeNotifier {
  double mySale = 0.0;
  double referralSale = 0.0;
  double totalSale = 0.0;
  double withDrawableBalance = 0.0;
  int network = 0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch sales data based on a date range
  Future<void> fetchSalesData(DateTimeRange selectedDateRange) async {
    DateTime start = selectedDateRange.start;
    DateTime end = selectedDateRange.end.add(Duration(days: 1));
    try {
      // Get the current user's ID
      String userId = AuthController().getUid();

      if (userId.isNotEmpty) {
        // Reference to the 'Influencer' document and 'sale' subcollection
        DocumentReference influencerRef =
            _firestore.collection('Influencer').doc(userId);
        CollectionReference saleRef = influencerRef.collection('sale');

        // Run both the document fetch and sub-collection query simultaneously
        List<Future> futures = [
          influencerRef.get(), // Fetch the main document
          saleRef
              .where('timestamp', isGreaterThanOrEqualTo: start)
              .where('timestamp', isLessThanOrEqualTo: end)
              .get() // Fetch the sale sub-collection
        ];

        // Wait for both futures to complete
        var results = await Future.wait(futures);

        // Extract the results
        DocumentSnapshot influencerDoc = results[0] as DocumentSnapshot;
        QuerySnapshot salesQuery = results[1] as QuerySnapshot;

        // Process main Influencer document data
        if (influencerDoc.exists) {
          withDrawableBalance =
              (influencerDoc['with_drawable_balance'] as num).toDouble();
          network = (influencerDoc['referral_network'] as num).toInt();
        }

        // Process sale subcollection data
        double totalMySale = 0.0;
        double totalReferralSale = 0.0;

        for (var doc in salesQuery.docs) {
          double mySaleValue = (doc['my_sale'] as num).toDouble();
          double referralSaleValue = (doc['referral_sale'] as num).toDouble();

          totalMySale += mySaleValue;
          totalReferralSale += referralSaleValue;
        }

        // Update the controller's sales fields
        mySale = totalMySale;
        referralSale = totalReferralSale;
        totalSale = mySale + referralSale;

        // Notify listeners to update the UI
        notifyListeners();
      }
    } catch (error) {
      print('Error fetching sales data: $error');
    }
  }
}
