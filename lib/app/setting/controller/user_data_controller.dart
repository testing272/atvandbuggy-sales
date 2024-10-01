import 'package:atvandbuggy_sales_app/app/authentication/controller/auth_controller.dart';
import 'package:atvandbuggy_sales_app/app/setting/model/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserDataController extends ChangeNotifier {
  final CollectionReference _influenceReference =
      FirebaseFirestore.instance.collection('Influencer');
  late UserDataModel userDataModel;

  Future<void> getUserDataFromFirebase() async {
    final response =
        await _influenceReference.doc(AuthController().getUid()).get();
    Map data = response.data() as Map;
    userDataModel = UserDataModel.fromMap(data);
    notifyListeners();
  }

  Future<void> updateUserNameLocallyAndInDB(String name) async {
    AuthController().updateUserName(name);
    userDataModel.name = name;
    notifyListeners();
  }
}
