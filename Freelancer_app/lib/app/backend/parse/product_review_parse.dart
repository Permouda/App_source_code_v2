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

class ProductReviewParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductReviewParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMyProductReviews(var body) async {
    var response = await apiService.postPrivate(
        AppConstants.getMyProductReviews,
        body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getFreelancerId() {
    return sharedPreferencesManager.getString('freelancerId') ?? '';
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }
}
