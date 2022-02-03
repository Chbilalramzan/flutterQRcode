import 'package:flutter/material.dart';
import 'package:qrcode/helper/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:qrcode/styles/app_colors.dart';

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({Key? key}) : super(key: key);

  @override
  _InitializationScreenState createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    SharedPreferenceHelper.getUserLoggedInSharedPreference()
        .then((value) => value == null || value == false
            ? Get.offNamed("/login")
                : Get.offNamed("/home"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
    );
  }

}
