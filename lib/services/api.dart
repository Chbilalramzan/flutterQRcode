import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qrcode/controllers/home_controller.dart';
import 'package:qrcode/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode/model/user_info.dart';
import 'package:qrcode/services/exception.dart';
import 'package:qrcode/utils/constants/api_paths.dart';

class Api {
  final homeController = Get.put(HomeController());
  final httpClient = http.Client();

  Future<List<User>> login() async {
    final String response = await rootBundle.loadString('assets/user.json');
    final data = await json.decode(response);
    return data['users'].map<User>((user) => User.fromJson(user)).toList();
  }

  Future<UserInfo> sendVerificationRequest(String userId) async {
    final _response = await httpClient.post(
      Uri.parse(ApiPath.verifyUser),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'user_id': userId}),
    );
    final _decoded = jsonDecode(_response.body);
    if (_response.statusCode == 200) {
      if (_decoded["_metadata"]['status'] == "SUCCESS") {
        return UserInfo.fromJson(_decoded['records']);
      }else{
        homeController.rerset();
         return UserInfo.fromJson(_decoded['records']);
      }
    } else {
      homeController.rerset();
      throw AppException(msg: _decoded['message']);
    }
  }
}
