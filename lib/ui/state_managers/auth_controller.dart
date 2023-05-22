import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;
  static ProfileData? get profile => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    //log(token.toString());
    await getProfileData();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = userToken;
    await sharedPreferences.setString('crafty_token', userToken);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _profileData = profile;
    await sharedPreferences.setString('user_profile', profile.toJson().toString());
  }

  Future<void> getProfileData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(jsonDecode(sharedPreferences.getString('user_profile') ?? '{}'));
  }

  Future<void> getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString('crafty_token');
  }

  Future<void> clearUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}