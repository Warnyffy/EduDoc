import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edudoc/app/services/auth.controller.dart';
import 'package:edudoc/app/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';

import '../models/user_model.dart';
import '../routes/app_routes.dart';

class FirebaseController extends GetxController {
  static FirebaseController instance = Get.find();
  var auth = Get.put(AuthController());

  String _getImageExtension(Uint8List byteData) {
    return lookupMimeType('', headerBytes: byteData)!.split('/').last;
  }

  createUser({
    required String name,
    required String email,
    required String password,
    required Uint8List profileImage,
  }) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Edudoc_Users");

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      dbRegistration(collectionReference, userCredential, name, email,
          profileImage, password);
    } on FirebaseAuthException catch (fbException) {
      if (fbException.code == 'email-already-in-use') {
        Get.snackbar(
          "Registration Failed",
          fbException.message!,
          backgroundColor: AppColors.customWhite,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          icon: Image.asset("assets/images/launcher.png"),
          duration: const Duration(seconds: 4),
          isDismissible: true,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Registration Failed",
        "$e",
        backgroundColor: AppColors.customWhite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        icon: Image.asset("assets/images/launcher.png"),
        duration: const Duration(seconds: 4),
        isDismissible: true,
      );
    }
  }

  /// method to save [UserModel] and [Profile] data to Cloud Firestore
  Future<UserModel> dbRegistration(
    CollectionReference<Object?> collectionReference,
    UserCredential userCredential,
    String username,
    String email,
    Uint8List profileImage,
    String password,
  ) async {
    User user = userCredential.user!;
    final _storageInstance = FirebaseStorage.instance;
    String? profilePic;

    final String fileExtension = _getImageExtension(profileImage);
    final metadata = SettableMetadata(contentType: 'image/$fileExtension');

    final UploadTask uploadTask = _storageInstance
        .ref('profilePictures/')
        .child(user.uid)
        .putData(profileImage, metadata);

    await uploadTask.then((e) async {
      profilePic = await e.ref.getDownloadURL();
    });

    UserModel userModel = UserModel(
      uid: user.uid,
      name: username,
      email: email,
      profileImage: profilePic!,
      password: password,
    );

    await collectionReference.doc(user.uid).set(userModel.toMap());
    Get.snackbar(
      "Sign up Success",
      "$username, you have Succesfully created an account in EduDoc",
      backgroundColor: AppColors.customWhite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      icon: Image.asset("assets/images/launcher.png"),
      duration: const Duration(seconds: 4),
      isDismissible: true,
    );
    Get.offAndToNamed(AppRoutes.succesScreen);
    return userModel;
  }

  login(String email, String password) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("EDUDOC_Users");

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => actionAfterLogIn(collectionReference))
        .catchError(
          (onError) => Get.snackbar(
            "Login Failed",
            onError.message,
            backgroundColor: AppColors.customWhite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            icon: Image.asset("assets/images/launcher.png"),
            duration: Duration(seconds: 5),
            isDismissible: true,
          ),
        );
  }

  actionAfterLogIn(CollectionReference<Object?> collectionReference) async {
    Get.snackbar(
      "Login Success",
      "You have Succesfully Logged In",
      backgroundColor: AppColors.customWhite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      icon: Image.asset("assets/images/launcher.png"),
      duration: Duration(seconds: 5),
      isDismissible: true,
    );
    auth.returnUser();
    Get.offAllNamed(AppRoutes.succesScreen);
  }
}
