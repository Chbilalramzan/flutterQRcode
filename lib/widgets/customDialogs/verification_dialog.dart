import 'package:flutter/material.dart';
import 'package:qrcode/controllers/home_controller.dart';
import 'package:qrcode/model/user_info.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/styles/app_styletext.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:get/get.dart';

class VerificationDialog extends StatelessWidget {
  VerificationDialog({
    Key? key,
    required this.height,
    required this.width,
    required this.user,
  }) : super(key: key);

  final double height;
  final double width;
  final UserInfo user;
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      backgroundColor: AppColors.dialogBoxColor,
      child: SizedBox(
        height: height * 0.38,
        width: width * 0.31,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                     homeController.back();
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.white,
                      size: Sizes.dimen_24,
                    )),
              ),
            ),
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(user.image),
              backgroundColor: Colors.transparent,
            ),
            Text(
              user.fname + " " + user.lname,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500),
            ),
             Text(
              "@"+user.username,
              textAlign: TextAlign.center,
              style: AppStyleText.infoDetailR16W4,
            ),
            Text(
              user.userRole.name,
              textAlign: TextAlign.center,
              style: AppStyleText.infoDetailR16W4,
            ),
            Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.12,
              decoration: const BoxDecoration(
                  color: AppColors.butttoColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: const Text(
                'Verified',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
