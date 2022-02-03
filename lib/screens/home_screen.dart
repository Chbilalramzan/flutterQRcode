import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode/controllers/home_controller.dart';
import 'package:qrcode/screens/qr_scanner.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/styles/app_styletext.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:qrcode/widgets/custom_button.dart';
import 'package:qrcode/widgets/user_tile.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final homeControllerPut = Get.put(HomeController());
  String connectionStatus = 'Unknown';
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            body: Row(
              children: [
                const QRCodeScanner(),
                SizedBox(
                    height: height,
                    width: width * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Sizes.dimen_24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => homeControllerPut.user.isEmpty
                                  ? const Text(
                                      "No user checked in yet",
                                      style: AppStyleText.infoDetailR16S,
                                    )
                                  : RichText(
                                      text: TextSpan(
                                          text: "Users recently checked in:  ",
                                          style: AppStyleText.infoDetailR16S,
                                          children: [
                                          TextSpan(
                                            text:
                                                "${homeControllerPut.user.length}",
                                            style: AppStyleText.infoDetailR16D7,
                                          )
                                        ]))),
                              CustomRaisedBtn(
                                  borderRadius: Sizes.dimen_12,
                                  onPressed: () {
                                    homeControllerPut.signOutDialog(
                                        height, width);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Sizes.dimen_16),
                                    child: Text(
                                      'LogOut',
                                      style: AppStyleText.largeTitleM18W,
                                    ),
                                  ),
                                  color: AppColors.buttonColor2,
                                  width: 100,
                                  height: Sizes.dimen_32),
                            ],
                          ),
                        ),
                        Obx(
                          () => Expanded(
                              child: homeControllerPut.user.isEmpty
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.list_rounded,
                                            color: AppColors.secondaryIconColor,
                                            size: 80,
                                          ),
                                          Text(
                                            'Start scanning QR to show recent users list...',
                                            style: AppStyleText.largeTitleR28,
                                          )
                                        ],
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: homeControllerPut.user.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return UserTile(
                                            width: width,
                                            user: homeControllerPut.user[index],
                                            formattedDate: homeControllerPut
                                                .formattedDate[index]);
                                      })),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Obx(() => Center(
              child: homeControllerPut.scanning.isTrue
                  ? Container(
                      width: width * 0.25,
                      height: height * 0.25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Sizes.dimen_16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Scanning!',
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColors.subTitleTextColor,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(height: 16),
                          CupertinoActivityIndicator(),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Please wait',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.subTitleTextColor,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    )
                  : const SizedBox())),
        ],
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        homeControllerPut.internetSuccessToast(context);
        break;
      case ConnectivityResult.mobile:
        homeControllerPut.internetSuccessToast(context);
        break;
      default:
        homeControllerPut.ineternetFailedToast(context);
        break;
    }
  }
}
