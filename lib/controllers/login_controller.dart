import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/helper/shared_preferences.dart';
import 'package:qrcode/model/user.dart';
import 'package:qrcode/services/api.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:connectivity/connectivity.dart';

class LogInController extends GetxController {
  final TextEditingController usernameControlleer = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get username => usernameControlleer.text.trim();
  String get password => passwordController.text.trim();

  final obsecureText = true.obs;

  final Api api = Api();
  late List<User> users;
  dynamic result;

  void login(BuildContext context) {
    api.login().then((value) => {
          users = value,
          result = users
              .where((user) =>
                  user.username == username && user.password == password)
              .isEmpty,
          if (result) {authFailed(context)} else {authSuccess(context)}
        });
  }

  void authFailed(BuildContext context) {
    Get.snackbar('Failed', "Password or Email is wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        colorText: Colors.white,
        maxWidth: MediaQuery.of(context).size.width * 0.4);
  }

  void authSuccess(BuildContext context) {
    SharedPreferenceHelper.saveUserLoggedInSharedPreference(true);
    Get.snackbar('Success', "Sign in Sccessfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        colorText: Colors.white,
        maxWidth: MediaQuery.of(context).size.width * 0.35);
    Get.offNamed('/home');
  }

  void setObsecureText(bool value) {
    obsecureText.value = value;
  }
}
