import 'package:atvandbuggy_sales_app/app/setting/controller/user_data_controller.dart';
import 'package:atvandbuggy_sales_app/app/setting/model/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ReferByController extends ChangeNotifier {
  final CollectionReference _influenceReference =
      FirebaseFirestore.instance.collection('Influencer');
  late UserDataModel referByUserDataModel;

  Future<void> getReferByUserFromFirebase(BuildContext context) async {
    String? referredById =
        Provider.of<UserDataController>(context, listen: false)
            .userDataModel
            .referredById;
    final response = await _influenceReference
        .where('referral_code', isEqualTo: referredById)
        .get();
    Map data = response.docs.first.data() as Map;
    referByUserDataModel = UserDataModel.fromMap(data);
    notifyListeners();
  }

  Future<int?> idValidReferralCode(String referralCode) async {
    try {
      QuerySnapshot querySnapshot = await _influenceReference
          .where('referral_code', isEqualTo: referralCode)
          .get();
      return querySnapshot.docs.first.get('level');
    } catch (e) {
      print("Error checking document existence: $e");
      return null;
    }
  }
}
