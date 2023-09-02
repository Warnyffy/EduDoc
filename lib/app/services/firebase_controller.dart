import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class FirebaseController extends GetxController {
  static FirebaseController instance = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> _firebaseUser;

  User? get user => _auth.currentUser;

  String? userName;
  String? userEmail;
  String? userPassword;

  final userState = GetStorage();
  final storeName = GetStorage();
  final storeEmail = GetStorage();
  final storePassword = GetStorage();

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
  }

  // this make sure that anytime the user authentication changes the user info will update
  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  createUser(String name, String email, String password) async {
    // final uid = user!.uid;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("EDUDOC_Users");

    Map<String, String> userData = {
      // "ID": uid,
      "Name": name,
      "Email": email,
      "Password": password
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => actionAfterRegister(collectionReference, userData))
        .catchError(
          (onError) => Get.snackbar(
            "EDUDOC Error",
            onError.message,
            backgroundColor: AppColors.customWhite,
            icon: Image.asset("assets/images/launcher.png"),
            duration: Duration(seconds: 5),
            isDismissible: true,
            // padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        );
  }

  actionAfterRegister(CollectionReference<Object?> collectionReference,
      Map<String, String> userData) async {
    // collectionReference.add(userData).then((value) => null);
    await collectionReference.doc(user!.uid).set(userData);
    await collectionReference.doc(user!.uid).get().then((value) {
      userName = value.get("Name");
      userEmail = value.get("Email");
      userPassword = value.get("Password");
    });
    Get.snackbar(
      "EDUDOC Success",
      "You have succesfully Registered in the database",
      backgroundColor: AppColors.customWhite,
      icon: Image.asset("assets/images/launcher.png"),
      duration: Duration(seconds: 5),
      isDismissible: true,
      // padding: EdgeInsets.symmetric(horizontal: 10),
    );
    storeName.write("USERNAME", userName);
    storeEmail.write("USEREMAIL", userEmail);
    storePassword.write("USERPASSWORD", userPassword);
    Get.offAndToNamed(AppRoutes.succesScreen);
    userState.write('isIN', true);
  }

  login(String email, String password) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("EDUDOC_Users");

    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => actionAfterLogIn(collectionReference))
        .catchError(
          (onError) => Get.snackbar(
            "EDUDOC Error",
            onError.message,
            backgroundColor: AppColors.customWhite,
            icon: Image.asset("assets/images/launcher.png"),
            duration: Duration(seconds: 5),
            isDismissible: true,
            // padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        );
  }

  actionAfterLogIn(CollectionReference<Object?> collectionReference) async {
    await collectionReference.doc(user!.uid).get().then((value) {
      userName = value.get("Name");
      userEmail = value.get("Email");
      userPassword = value.get("Password");
    });

    storeName.write("USERNAME", userName);
    storeEmail.write("USEREMAIL", userEmail);
    storePassword.write("USERPASSWORD", userPassword);
    userState.write('isIN', true);
    Get.snackbar(
      "EDUDUC Success",
      "You have Succesfully Logged In",
      backgroundColor: AppColors.customWhite,
      icon: Image.asset("assets/images/launcher.png"),
      duration: Duration(seconds: 5),
      isDismissible: true,
      // padding: EdgeInsets.symmetric(horizontal: 10),
    );
    Get.offAllNamed(AppRoutes.bottomnavScreen);
    // },
  }
}
