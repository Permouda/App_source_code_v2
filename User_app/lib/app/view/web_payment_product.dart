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
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:handyman/app/controller/web_payment_product_controller.dart';
import 'package:handyman/app/util/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPaymentProduct extends StatefulWidget {
  const WebPaymentProduct({Key? key}) : super(key: key);

  @override
  State<WebPaymentProduct> createState() => _WebPaymentProductState();
}

class _WebPaymentProductState extends State<WebPaymentProduct> {
  bool isLoading = true;
  bool recallAPI = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebPaymentProductController>(builder: (value) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              WebView(
                initialUrl: value.paymentURL,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {},
                onProgress: (int progress) {},
                navigationDelegate: (NavigationRequest request) {
                  checkCallback(request.url);
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  checkCallback(url);
                },
                onPageFinished: (String url) {
                  setState(() {
                    isLoading = false;
                  });
                  checkCallback(url);
                },
                gestureNavigationEnabled: true,
                backgroundColor: ThemeProvider.whiteColor,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ThemeProvider.appColor,
                      ),
                    )
                  : Stack(),
            ],
          ),
        ),
      );
    });
  }

  void checkCallback(String callback) {
    debugPrint(callback);
    if (recallAPI == true) {
      if (callback.contains('success_payments') ||
          callback.contains('failed_payments') ||
          callback.contains('status=authorized') ||
          callback.contains('status=failed') ||
          callback.contains('success') ||
          callback.contains('close') ||
          callback.contains('redirect_callback')) {
        setState(() {
          recallAPI = false;
        });
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        // RazorPay Pay Later URL => payments/create/checkout
        if (callback.contains('success_payments') ||
            callback.contains('status=authorized') ||
            callback.contains('success') ||
            callback.contains('close') ||
            callback.contains('redirect_callback')) {
          if (Get.find<WebPaymentProductController>().payMethod == 'paypal') {
            final successCallback = Uri.parse(callback);
            final payKey = successCallback.queryParameters['pay_id'];
            Get.find<WebPaymentProductController>()
                .createOrder(payKey.toString());
          } else if (Get.find<WebPaymentProductController>().payMethod ==
              'paytm') {
            final successCallback = Uri.parse(callback);
            final payId = successCallback.queryParameters['id'];
            final taxId = successCallback.queryParameters['txt_id'];
            var payData = {'key': payId, 'txtId': taxId};
            Get.find<WebPaymentProductController>()
                .createOrder(jsonEncode(payData));
          } else if (Get.find<WebPaymentProductController>().payMethod ==
              'razorpay') {
            final successCallback = Uri.parse(callback).path;
            debugPrint(successCallback);
            if (successCallback.toString().split('/').length >= 5 &&
                successCallback.toString().split('/')[3].startsWith('pay_')) {
              final paymentId = successCallback.toString().split('/')[3];

              Get.find<WebPaymentProductController>()
                  .verifyRazorpayPurchase(paymentId.toString());
            }
          } else if (Get.find<WebPaymentProductController>().payMethod ==
              'instamojo') {
            final successCallback = Uri.parse(callback);
            final payId = successCallback.queryParameters['payment_id'];
            Get.find<WebPaymentProductController>()
                .createOrder(payId.toString());
          } else if (Get.find<WebPaymentProductController>().payMethod ==
              'paystack') {
            final successCallback = Uri.parse(callback);
            final payId = successCallback.queryParameters['id'];
            Get.find<WebPaymentProductController>()
                .createOrder(payId.toString());
          } else if (Get.find<WebPaymentProductController>().payMethod ==
              'flutterwave') {
            final successCallback = Uri.parse(callback);
            final taxRef = successCallback.queryParameters['tx_ref'];
            final orderId = successCallback.queryParameters['transaction_id'];
            var payData = {'orderId': orderId, 'txtId': taxRef};
            Get.find<WebPaymentProductController>()
                .createOrder(jsonEncode(payData));
          }
        }
      }
    }
  }
}
