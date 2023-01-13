/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman/app/controller/notification_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => NotificationController(parser: Get.find()),
    );
  }
}
