/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman/app/controller/service_detail_controller.dart';

class ServiceDetailBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ServiceDetailController(parser: Get.find()),
    );
  }
}
