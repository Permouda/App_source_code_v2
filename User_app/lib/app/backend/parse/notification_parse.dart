/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:handyman/app/backend/api/api.dart';
import 'package:handyman/app/helper/shared_pref.dart';

class NotificationParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  NotificationParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
