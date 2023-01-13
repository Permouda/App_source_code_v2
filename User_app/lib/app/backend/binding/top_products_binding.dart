/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman/app/controller/top_products_controller.dart';

class TopProductsBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => TopProductsController(parser: Get.find()),
    );
  }
}
