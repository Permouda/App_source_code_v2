/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/controller/product_order_detail_controller.dart';

class ProductOrderDetailBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ProductOrderDetailController(parser: Get.find()),
    );
  }
}
