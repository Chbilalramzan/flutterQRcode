import 'package:flutter/material.dart';
import 'package:qrcode/screens/home_screen.dart';
import 'package:qrcode/screens/initialization_screen.dart';
import 'package:qrcode/screens/login_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VExpo QR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
         GetPage(name: '/init', page: () => InitializationScreen()),
        GetPage(name: '/login', page: () => const LogInScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      initialRoute: '/init',
    );
  }
}

