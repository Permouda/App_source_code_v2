/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/backend/api/api.dart';
import 'package:handyman_freelancer/app/helper/shared_pref.dart';
import 'package:handyman_freelancer/app/util/constant.dart';

class ProductCategoryParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductCategoryParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMyProductCategory() async {
    var response = await apiService.getPrivate(
        AppConstants.getMyProductCategory,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }
}
