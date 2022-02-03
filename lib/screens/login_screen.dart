import 'package:flutter/material.dart';
import 'package:qrcode/controllers/login_controller.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/styles/app_styletext.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:qrcode/widgets/custom_button.dart';
import 'package:qrcode/widgets/k_inputfield.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final loginController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/qrtabbg.png"),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.28,
                      width: width * 0.35,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Sizes.dimen_40, bottom: Sizes.dimen_42),
                      child: Column(
                        children: [
                          KInputField(
                              width: width * 0.25,
                              hintText: "User Name",
                              prefixIcon: const SizedBox(),
                              suffixIcon: const SizedBox(),
                              textInputType: TextInputType.text,
                              controller: loginController.usernameControlleer,
                              hintTextStyle: AppStyleText.infoDetailM16S5,
                              textStyle: AppStyleText.infoDetailM16P5,
                              suffixText: ''),
                          const SizedBox(height: 22),
                          Obx(() => KInputField(
                              width: width * 0.25,
                              hintText: "Password",
                              obscureText: loginController.obsecureText.value,
                              prefixIcon: const SizedBox(),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  loginController.obsecureText.value
                                      ? loginController.setObsecureText(false)
                                      : loginController.setObsecureText(true);
                                },
                                child: Icon(
                                  loginController.obsecureText.value ? Icons.remove_red_eye : Icons.remove_red_eye_outlined ,
                                  size: Sizes.dimen_24,
                                ),
                              ),
                              textInputType: TextInputType.text,
                              controller: loginController.passwordController,
                              hintTextStyle: AppStyleText.infoDetailM16S5,
                              textStyle: AppStyleText.infoDetailM16P5,
                              suffixText: '')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Sizes.dimen_42, bottom: Sizes.dimen_22),
                      child: CustomRaisedBtn(
                          onPressed: () {
                            sigIn(context);
                          },
                          borderRadius: Sizes.dimen_18,
                          width: width * 0.25,
                          height: Sizes.dimen_56,
                          child: const Text(
                            'Sign In',
                            style: AppStyleText.buttonSM20W5,
                          ),
                          color: AppColors.butttoColor),
                    ),
                    const Text(
                      'VEXPO QR Scanner',
                      style: AppStyleText.buttonSM20S5,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sigIn(BuildContext context) {
    if (loginController.username == "" || loginController.password == "") {
      Get.snackbar('Error', "Password or Email is missing",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.butttoColor,
          margin: const EdgeInsets.all(15),
          isDismissible: true,
          colorText: Colors.white,
          maxWidth: MediaQuery.of(context).size.width * 0.4);
    } else {
      loginController.login(context);
    }
  }
}
