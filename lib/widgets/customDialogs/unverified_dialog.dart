import 'package:flutter/material.dart';
import 'package:qrcode/controllers/home_controller.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:get/get.dart';

class UnverifiedDialog extends StatelessWidget {
  UnverifiedDialog({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
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
            Image.asset(
              'assets/icons/vector.png',
              height: 80,
              width: 80,
            ),
            const Text(
              'Not a valid QR Code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
