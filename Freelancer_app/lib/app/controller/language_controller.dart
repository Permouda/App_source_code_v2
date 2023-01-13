/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/backend/parse/language_parse.dart';

class LanguageController extends GetxController implements GetxService {
  final LanguageParser parser;

  int filter = 1;
  late String languageCode;

  LanguageController({required this.parser});
  @override
  void onInit() {
    super.onInit();
    languageCode = parser.getDefault();
  }

  void onFilter(var id) {
    filter = id;
    update();
  }

  void saveLanguages(String code) {
    var locale = Locale(code.toString());
    Get.updateLocale(locale);
    parser.saveLanguage(code);
    languageCode = code;
    update();
  }
}
