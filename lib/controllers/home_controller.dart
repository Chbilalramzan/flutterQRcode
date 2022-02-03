import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/model/user_info.dart';
import 'package:qrcode/services/api.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/widgets/customDialogs/signout_dialog.dart';
import 'package:qrcode/widgets/customDialogs/unverified_dialog.dart';
import 'package:qrcode/widgets/customDialogs/verification_dialog.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  dynamic username;
  RxBool scanning = false.obs;
  QRViewController? qrViewController;
  RxList<UserInfo> user = RxList<UserInfo>();
  RxBool isIdDefiend = true.obs;
  List<String> formattedDate = [];
  List<String> urls = ['loopexpo', 'vexpo'];

  void setQRUrl(Barcode? qrCodeResult, double height, double width) {
    var url = qrCodeResult!.code;
    if (url!.contains('loopexpo')) {
      Uri.parse(url).queryParameters.forEach((k, v) {
        if (k == "id") {
          Api().sendVerificationRequest(v).then((value) => {
                scanning.value = false,
                formattedDate.add(
                    DateFormat('kk:mm:ss | EEE d MMM').format(DateTime.now())),
                user.add(value),
                verifiedDialog(height, width, value)
              });
        }
      });
    } else {
      rerset();
    }

    update();
  }

  void setQRViewController(QRViewController? controller) {
    qrViewController = controller;
    update();
  }

  void setScanning(dynamic value) {
    scanning.value = value;
  }

  void resetUserList() {
    user.clear();
  }

  Future<void> signOutDialog(double height, double width) async {
    await Get.dialog(SignOutDialog(height: height, width: width));
  }

  Future<void> unVerifiedDialog(double height, double width) async {
    await Get.dialog(
      UnverifiedDialog(height: height, width: width),
      barrierDismissible: false,   
    );
  }

  Future<void> verifiedDialog(
      double height, double width, UserInfo user) async {
    await Get.dialog(
        VerificationDialog(height: height, width: width, user: user), barrierDismissible: false);
  }

  void ineternetFailedToast(BuildContext context) {
    Get.snackbar('Disconnected', "Internet disconnected",
        snackPosition: SnackPosition.BOTTOM,
        duration:const Duration(seconds: 5),
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        colorText: Colors.white,
        maxWidth: MediaQuery.of(context).size.width * 0.4);
  }

  void internetSuccessToast(BuildContext context) {
    Get.snackbar('Connected', "Intenet connected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        colorText: Colors.white,
        maxWidth: MediaQuery.of(context).size.width * 0.35);
  }


  void rerset() {
    scanning.value = false;
    unVerifiedDialog(860, 1440);
  }

  void back() {
    Get.back();
    qrViewController?.resumeCamera();
  }



}
