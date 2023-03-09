import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:softbyhasan/main.dart';
import 'package:softbyhasan/ui/screens/loginScreen.dart';
import 'package:softbyhasan/ui/utils/auth-utils.dart';

class NetworkUtils{

  /// Get Method for Api
  Future<dynamic> getMethod(String url, VoidCallback? onUnAuthorize) async{

    try{
      final http.Response response = await http.get(Uri.parse(url));
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onUnAuthorize != null){
          onUnAuthorize();
        } else{
          moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch(e){
      log('Error $e');
    }
  }

  /// Post Method for Api
  Future<dynamic> postMethod(String url, {Map<String, String>? body, VoidCallback? onUnAuthorize, String? token}) async{

    try{
      final http.Response response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'token': token ?? ''
          },
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if(onUnAuthorize != null){
          onUnAuthorize();
        }else{
          moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch(e){
      log('Error $e');
    }
  }

  Future<void> moveToLogin() async {
    await AuthUtils.clearData();
    Navigator.pushAndRemoveUntil(
        TaskManager.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

}