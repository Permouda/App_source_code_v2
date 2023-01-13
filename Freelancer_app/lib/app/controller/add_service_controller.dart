/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyman_freelancer/app/backend/api/handler.dart';
import 'package:handyman_freelancer/app/backend/parse/add_service_parse.dart';
import 'package:handyman_freelancer/app/controller/service_controller.dart';
import 'package:handyman_freelancer/app/util/theme.dart';
import 'package:handyman_freelancer/app/util/toast.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceController extends GetxController implements GetxService {
  final AddServiceParser parser;

  XFile? _selectedImage;

  String selectedCateName = '';
  String selectedCateId = '';
  final nameTextEditor = TextEditingController();
  final durationTextEditor = TextEditingController();
  final priceTextEditor = TextEditingController();
  final discountTextEditor = TextEditingController();
  final offTextEditor = TextEditingController();
  final descriptionsTextEditor = TextEditingController();
  int selectedStatus = 1;

  bool apiCalled = false;

  String cover = '';

  List<String> images = ['', '', '', '', '', ''];

  int serviceId = 0;
  String action = 'new';
  AddServiceController({required this.parser});

  void onSaveCategory(String id, String name) {
    selectedCateName = name;
    selectedCateId = id;
    debugPrint('got from service list');
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments[0] == 'edit') {
      action = 'edit';
      serviceId = Get.arguments[1] as int;
      debugPrint('service id======= $serviceId');
      getServiceById();
    } else {
      apiCalled = true;
    }
  }

  // Futur

  Future<void> onSubmit() async {
    if (nameTextEditor.text == '' ||
        nameTextEditor.text.isEmpty ||
        selectedCateId == '' ||
        selectedCateId.isEmpty ||
        durationTextEditor.text == '' ||
        durationTextEditor.text.isEmpty ||
        priceTextEditor.text == '' ||
        priceTextEditor.text.isEmpty ||
        discountTextEditor.text == '' ||
        discountTextEditor.text.isEmpty ||
        descriptionsTextEditor.text == '' ||
        descriptionsTextEditor.text.isEmpty ||
        cover == '' ||
        cover.isEmpty) {
      showToast('All fields are required'.tr);
      return;
    }

    var body = {
      "uid": parser.getUID(),
      "name": nameTextEditor.text,
      "cate_id": selectedCateId,
      "duration": durationTextEditor.text,
      "price": priceTextEditor.text,
      "off": offTextEditor.text,
      "discount": discountTextEditor.text,
      "images": jsonEncode(images),
      "cover": cover,
      "extra_field": 'NA',
      "status": selectedStatus,
      "descriptions": descriptionsTextEditor.text,
    };
    Get.dialog(
        SimpleDialog(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const CircularProgressIndicator(
                  color: ThemeProvider.appColor,
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                    child: Text(
                  "Please wait".tr,
                  style: const TextStyle(fontFamily: 'bold'),
                )),
              ],
            )
          ],
        ),
        barrierDismissible: false);
    var response = await parser.onSubmit(body);
    Get.back();
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      successToast('Addded'.tr);
      Get.find<ServiceController>().getMyServices();
      onBack();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  void onBack() {
    var context = Get.context as BuildContext;
    Navigator.of(context).pop(true);
  }

  void selectFromGallery(String kind) async {
    _selectedImage = await ImagePicker().pickImage(
        source: kind == 'gallery' ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 25);
    update();
    if (_selectedImage != null) {
      Get.dialog(
          SimpleDialog(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const CircularProgressIndicator(
                    color: ThemeProvider.appColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                      child: Text(
                    "Please wait".tr,
                    style: const TextStyle(fontFamily: 'bold'),
                  )),
                ],
              )
            ],
          ),
          barrierDismissible: false);
      Response response = await parser.uploadImage(_selectedImage as XFile);
      Get.back();
      if (response.statusCode == 200) {
        _selectedImage = null;
        if (response.body['data'] != null && response.body['data'] != '') {
          dynamic body = response.body["data"];
          if (body['image_name'] != null && body['image_name'] != '') {
            cover = body['image_name'];
            debugPrint(cover);
            update();
          }
        }
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }

  void selectFromGalleryOthers(String kind, int index) async {
    _selectedImage = await ImagePicker().pickImage(
        source: kind == 'gallery' ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 25);
    update();
    if (_selectedImage != null) {
      Get.dialog(
          SimpleDialog(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const CircularProgressIndicator(
                    color: ThemeProvider.appColor,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                      child: Text(
                    "Please wait".tr,
                    style: const TextStyle(fontFamily: 'bold'),
                  )),
                ],
              )
            ],
          ),
          barrierDismissible: false);
      Response response = await parser.uploadImage(_selectedImage as XFile);
      Get.back();
      if (response.statusCode == 200) {
        _selectedImage = null;
        if (response.body['data'] != null && response.body['data'] != '') {
          dynamic body = response.body["data"];
          if (body['image_name'] != null && body['image_name'] != '') {
            // cover = body['image_name'];
            images[index] = body['image_name'];
            // debugPrint(cover);
            update();
          }
        }
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }

  void updateStatus(int status) {
    selectedStatus = status;
    update();
  }

  Future<void> getServiceById() async {
    var response = await parser.getServiceByID({"id": serviceId});
    apiCalled = true;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var body = myMap['data'];
      debugPrint(body.toString());
      cover = body['cover'];
      selectedCateId = body['cate_id'].toString();
      nameTextEditor.text = body["name"];
      selectedCateName = body['web_cates_data']['name'].toString();
      durationTextEditor.text = body['duration'].toString();
      priceTextEditor.text = body["price"].toString();
      discountTextEditor.text = body['discount'].toString();
      offTextEditor.text = body['off'].toString();
      descriptionsTextEditor.text = body['descriptions'];
      selectedStatus = body['status'];
      var imgs = jsonDecode(body['images']);
      images = [];
      imgs.forEach((element) {
        images.add(element.toString());
      });

      update();
    } else {
      ApiChecker.checkApi(response);
    }

    update();
  }

  Future<void> onUpdateService() async {
    var body = {
      "name": nameTextEditor.text,
      "cate_id": selectedCateId,
      "duration": durationTextEditor.text,
      "price": priceTextEditor.text,
      "off": offTextEditor.text,
      "discount": discountTextEditor.text,
      "images": jsonEncode(images),
      "cover": cover,
      "extra_field": 'NA',
      "status": selectedStatus,
      "descriptions": descriptionsTextEditor.text,
      "id": serviceId
    };
    var response = await parser.onUpdateService(body);
    Get.back();
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      successToast('update'.tr);
      Get.find<ServiceController>().getMyServices();
      onBack();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  void onRealPrice(var input) {
    if (input != '' && discountTextEditor.text != '') {
      double value = num.tryParse(input)!.toDouble();
      debugPrint(value.toString());
      double sellPriceFinal = num.tryParse(discountTextEditor.text)!.toDouble();
      if (sellPriceFinal > 0 && value > 1) {
        double discountPriceFinal =
            num.tryParse(discountTextEditor.text)!.toDouble();
        double realPrice = num.tryParse(priceTextEditor.text)!.toDouble();
        percentage(discountPriceFinal, realPrice);
      }
    }
  }

  void onDiscountPrice(var input) {
    if (input != '' && priceTextEditor.text != '') {
      double value = num.tryParse(input)!.toDouble();
      double realPrice = num.tryParse(priceTextEditor.text)!.toDouble();
      if (realPrice > 0 && value <= 99) {
        double discountPriceFinal =
            num.tryParse(discountTextEditor.text)!.toDouble();
        percentage(discountPriceFinal, realPrice);
      }
      if (value >= 99) {
        discountTextEditor.text = '';
        discountTextEditor.text = '99';
        showToast('Discount must be less than 100'.tr);
        update();
      }
    }
  }

  void percentage(double percent, double total) {
    double sum = (total * percent) / 100;
    sum = double.parse((sum).toStringAsFixed(2));
    debugPrint(sum.toString());
    // sellPrice.text = sum.toString();
    double realPrice = num.tryParse(priceTextEditor.text)!.toDouble();
    offTextEditor.text = (realPrice - sum).toString();
    update();
  }
}
