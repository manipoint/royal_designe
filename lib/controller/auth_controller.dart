import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/firebase.dart';
import 'package:royal_designe/model/user_model.dart';
import 'package:royal_designe/pages/auth/auth.dart';
import 'package:royal_designe/pages/main_screen.dart';
import 'package:royal_designe/util/loading_icon.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  // RxBool isLoggedIn = false.obs;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();

  //address
  TextEditingController street = TextEditingController();
  TextEditingController block = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postcode = TextEditingController();

  //search
  TextEditingController searchController = TextEditingController();

  //custumization
  TextEditingController customName = TextEditingController();
  TextEditingController customDis = TextEditingController();

  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;
  Rx<LocationModel> locationModel = LocationModel().obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => const MainScreen());
    }
  }

  void signIn() async {
    try {
      const Loading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    const Loading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      passwordClear();
      Get.snackbar("Signup Failed", "Try again");
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": {"first": firstName.text, "last": lastName.text},
      "id": userId,
      "roll": "user",
      "email": email.text.toLowerCase().trim(),
      "phone": phone.text.trim(),
      "cart": [],
      "favorite": [],
      "location": {
        "street": street.text,
        "block": block.text,
        "city": city.text,
        "state": state.text,
        "postcode": postcode.text,
        "country": country.text,
      }
    });
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((query) => UserModel.fromJson(query.data()!));

  _clearControllers() {
    firstName.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    phone.clear();
  }

  passwordClear() {
    password.clear();
    confirmPassword.clear();
  }

  _clearAddressControllers() {
    block.clear();
    street.clear();
    city.clear();
  }

  updateUserAddress() {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update({
      "location": {
        "street": street.text,
        "block": block.text,
        "city": city.text,
        "postcode": postcode.text,
        "state": state.text,
        "country": country.text
      }
    });
    _clearAddressControllers();
  }

  updateUserData(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  Future<UserModel> getFirestoreUser() {
    return firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .get()
        .then(
            (documentSnapshot) => UserModel.fromJson(documentSnapshot.data()!));
  }
}
