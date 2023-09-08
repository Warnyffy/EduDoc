import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserModel user;

  @override
  void onInit() {
    /// We forcing this as the first controller
    debugPrint("Init State");
    super.onInit();
  }

  @override
  void onReady() {
    returnUser();
    super.onReady();
  }

  // Check if user has been authenticated
  bool authenticated() {
    return _auth.currentUser == null ? false : true;
  }

  /// Method to return user from firestore database. Returns dynamic ie either [userModel] or [null]
  Future<UserModel?> returnUser() async {
    // checking if the user is authenticated
    /// if user exists return user json and convert to [UserModel] also return [Profile]
    if (authenticated()) {
      var doc = await _firestore
          .collection("Edudoc_Users")
          .doc(_auth.currentUser!.uid)
          .get();

      Map<String, dynamic>? data = doc.data();
      user = UserModel.fromMap(data!);
      return user;
    } else {
      return null;
    }
  }

  // Logout of the application
  logout() async {
    await _auth.signOut();
  }
}
