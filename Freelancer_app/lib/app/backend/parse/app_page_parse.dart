/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:handyman_freelancer/app/backend/api/api.dart';
import 'package:handyman_freelancer/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/util/constant.dart';

class AppPageParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AppPageParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getContentById(var id) async {
    return await apiService.postPublic(AppConstants.pageContent, {'id': id});
  }
}
