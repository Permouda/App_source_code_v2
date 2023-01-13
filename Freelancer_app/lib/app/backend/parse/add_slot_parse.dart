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

class AddSlotParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AddSlotParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> onSubmitSlot(dynamic body) async {
    var response = await apiService.postPrivate(AppConstants.slotCreate, body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> getSlotById(var body) async {
    var response = await apiService.postPrivate(AppConstants.slotById, body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> onUpdateSlot(var body) async {
    var response = await apiService.postPrivate(AppConstants.slotUpdate, body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '0';
  }
}
