import 'package:flutter/material.dart';
import 'package:qrcode/helper/shared_preferences.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/styles/app_styletext.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:qrcode/widgets/custom_button.dart';
import 'package:get/get.dart';

class SignOutDialog extends StatelessWidget {
  final double height;
  final double width;
  const SignOutDialog({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      backgroundColor: AppColors.dialogBoxColor,
      child: SizedBox(
        height: height * 0.38,
        width: width * 0.42,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, color: AppColors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRaisedBtn(
                    onPressed: () {
                      Get.back();
                    },
                    borderRadius: Sizes.dimen_18,
                    width: width * 0.15,
                    height: Sizes.dimen_56,
                    child: const Text(
                      'Cancel',
                      style: AppStyleText.buttonSM20W5,
                    ),
                    color: AppColors.butttoColor),
                CustomRaisedBtn(
                    onPressed: () {
                      SharedPreferenceHelper.clearSharedPreferenceOnLogOut();
                      Get.back();
                      Get.offNamed('/login');
                    },
                    borderRadius: Sizes.dimen_18,
                    width: width * 0.15,
                    height: Sizes.dimen_56,
                    child: const Text(
                      'Yes',
                      style: AppStyleText.buttonSM20W5,
                    ),
                    color: AppColors.butttoColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
