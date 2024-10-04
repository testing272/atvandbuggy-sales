import 'dart:io';
import 'dart:math';

import 'package:atvandbuggy_sales_app/constant/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../permission/permission_handler.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _influenceReference =
      FirebaseFirestore.instance.collection('Influencer');

  Future signInUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final response =
          await _influenceReference.where('email', isEqualTo: email).get();
      if (response.docs.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        User? user = userCredential.user;
        return user;
      } else {
        showCustomToast(context,
            'No account found with this email. Please verify that you have a sales account, or create a new account using a referral.');
        return null;
      }
    } catch (e) {
      showCustomToast(context, removeErrorCode(e.toString()));
      return null;
    }
  }

  Future<void> updateUserName(String name) async {
    await _influenceReference.doc(getUid()).update({
      'name': name,
    });
  }

  Future<bool> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showCustomToast(context, 'No user found for that email.');
      } else {
        showCustomToast(
            context, 'Failed to send password reset email: ${e.code}');
      }
    } catch (e) {
      showCustomToast(context, 'Error sending password reset email: $e');
    }
    return false;
  }

  getUid() {
    return _auth.currentUser?.uid;
  }

  bool isUserLoggedIn() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  String? getEmail() {
    return _auth.currentUser!.email;
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future createUserWithEmailAndPassword(
      String email,
      String password,
      String firstName,
      String lastName,
      String referredById,
      int referByLevel,
      String referredByUid,
      BuildContext context) async {
    try {
      String referralCode =
          '${firstName.trim().toLowerCase()}${lastName.trim().toLowerCase()}';
      final response =
          await isUserAlreadyExistsWithThisReferralNameCode(referralCode);
      if (response) {
        showCustomToast(context,
            'A user already exists with this name, please try a different name');
        return null;
      }
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      createUser(
          referredByLevel: referByLevel,
          referredByCode: referredById,
          firstName: firstName,
          lastName: lastName,
          email: email,
          referralCode: referralCode,
          referredByUid: referredByUid,
          uid: user!.uid);
      return user;
    } catch (e) {
      showCustomToast(context, removeErrorCode(e.toString()));
      print(e.toString());
      return null;
    }
  }

  Future createUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String uid,
      required String referredByCode,
      required String referredByUid,
      required int referredByLevel,
      required String referralCode,
      String? profileUrl}) async {
    try {
      ///Create account for new user
      await _influenceReference.doc(getUid()).set({
        'name': '$firstName $lastName',
        'email': email,
        'my_sale': 0,
        'referral_sale': 0,
        'total_sale': 0,
        'with_drawable_balance': 0,
        'referral_network': 0,
        'created_at': FieldValue.serverTimestamp(),
        'created_by': uid,
        'referred_by_uid': referredByUid,
        'referred_by_code': referredByCode,
        'uid': uid,
        'referral_code': referredByLevel >= 2 ? null : referralCode,
        'level': referredByLevel + 1
      });

      ///Add it's id to parent network
      await _influenceReference.doc(referredByUid).update({
        'referral_network': FieldValue.increment(1),
      });

      ///increment parent network
      await _influenceReference
          .doc(referredByUid)
          .collection('network')
          .doc(uid)
          .set({
        'user_uid': uid,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  String formatDateKey(DateTime dateTime) {
    // Extract month, day, and year
    String month =
        dateTime.month.toString().padLeft(2, '0'); // Ensures two digits
    String day = dateTime.day.toString().padLeft(2, '0'); // Ensures two digits
    String year = dateTime.year.toString(); // Gets the full year

    // Concatenate in MMDDYYYY format
    String dateKey = '$month$day$year';

    return dateKey;
  }

  Future<bool> isUserAlreadyExistsWithThisReferralNameCode(
      String referralCode) async {
    try {
      QuerySnapshot querySnapshot = await _influenceReference
          .where('referral_code', isEqualTo: referralCode)
          .get();
      return querySnapshot.docs.length > 0;
    } catch (e) {
      print("Error checking document existence: $e");
      return false;
    }
  }

  String removeErrorCode(String firebaseError) {
    // Regular expression to find text enclosed in square brackets
    final RegExp regex = RegExp(r'\[.*?\]');

    // Replace all occurrences of the pattern with an empty string
    return firebaseError.replaceAll(regex, '').trim();
  }

  changeProfilePhoto(BuildContext context, bool isCamera) async {
    late bool status;
    if (isCamera) {
      status = await requestCameraPermission();
    } else {
      status = await requestGalleryPermission();
    }

    if (status) {
      File? image = await pickImage(isCamera);
      if (image != null) {
        showLoader(context);
        showCustomToast(context, 'Uploading profile photo, please wait.');
        String? url = await uploadImageToFirebaseStorage(image);
        if (url != null) {
          updateProfilePicture(url);
          Navigator.pop(context);
        }
      }
    } else {
      openSettings(
          context,
          'To upload profile picture, please enable camera and photos permissions.',
          true, () {
        Navigator.pop(context);
        openAppSettings();
      });
    }
  }

  updateProfilePicture(String imageUrl) async {
    _influenceReference.doc(getUid()).update({'profile_url': imageUrl});
  }

  Future<File?> pickImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 550,
        maxWidth: 550);
    return image != null ? File(image.path) : null;
  }

  Future<String?> uploadImageToFirebaseStorage(File? imageFile) async {
    try {
      if (imageFile == null) {
        return null;
      }
      Random random = Random();
      String fileName = '${random.nextInt(10000)}.jpg';
      String storagePath =
          'users/${AuthController().getUid()}/userProfile/$fileName';
      UploadTask uploadTask =
          FirebaseStorage.instance.ref(storagePath).putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print("Error in uploading file: ${snapshot.state}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
