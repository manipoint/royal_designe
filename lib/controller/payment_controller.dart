// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/constants/firebase.dart';
import 'package:royal_designe/model/payment.dart';
import 'package:royal_designe/pages/main_screen.dart';
// import 'package:http/http.dart' as http;
import 'package:royal_designe/util/loading_icon.dart';
import 'package:uuid/uuid.dart';

class PaymentsController extends GetxController {
  static PaymentsController instance = Get.find();
  String collection = "payments";
  List<PaymentsModel> payments = [];
  //Map<String, dynamic>? _paymentSheetData;
 // Rx<int> step = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  //   //Stripe.publishableKey = stripePublishableKey;
  //   Stripe.merchantIdentifier = 'MerchantIdentifier';
  // }

  // Future<void> initPaymentSheet() async {
  //   try {
  //     // 1. create payment intent on the server
  //     _paymentSheetData = await createTestPaymentSheet();
  //     // 2. initialize the payment sheet
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             applePay: true,
  //             googlePay: true,
  //             style: ThemeMode.dark,
  //             testEnv: true,
  //             merchantCountryCode: 'DE',
  //             merchantDisplayName: "Qasre-E-Shreen Payments",
  //             customerId: _paymentSheetData!['customer'],
  //             paymentIntentClientSecret: _paymentSheetData!['paymentIntent'],
  //             customerEphemeralKeySecret: _paymentSheetData!['ephemeralKey'],
  //             customFlow: true));
  //     step.value = 1;
  //   } catch (e) {
  //     Get.snackbar('Error', '$e');
  //     rethrow;
  //   }
  // }

  // Future<void> presentPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     step.value = 2;
  //     Get.snackbar("Payment Option", 'Payment option selected');
  //   } on Exception catch (e) {
  //     if (e is StripeException) {
  //       Get.snackbar(
  //           'Error from Stripe: ', e.error.localizedMessage.toString());
  //     } else {
  //       Get.snackbar('Unforeseen error', e.toString());
  //     }
  //   }
  // }

  // Future<void> confirmPayment() async {
  //   try {
  //     String custumerId = _paymentSheetData!['customer'];
  //     await Stripe.instance.confirmPaymentSheetPayment();
  //     _paymentSheetData = null;

  //     step.value = 0;
  //     _addToCollection(paymentId: custumerId, paymentStatus: 'success');
  //     authController.updateUserData({"cart": []});
  //     Get.to(const MainScreen());
  //     Get.snackbar('Payment Sccesfull', 'Payment succesfully completed');
  //   } on Exception catch (e) {
  //     if (e is StripeException) {
  //       Get.snackbar(
  //           'Error from Stripe: ', e.error.localizedMessage.toString());
  //     } else {
  //       Get.snackbar('Unforeseen error', e.toString());
  //     }
  //   }
  // }

  // Future<Map<String, dynamic>> createTestPaymentSheet() async {
  //   //double totalCosttodouble = cartController.totalCartPrice.value.toDouble();
  //   double totalCosttodouble =
  //       (cartController.totalCartPrice.value / 156).toDouble();
  //   int amount = (totalCosttodouble * 100).toInt();
  //   try {} catch (e) {
  //     // print(e.toString());
  //   }
  //   final url = Uri.parse('$kApiUrl/payment-sheet');
  //   final responce = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'email': authController.userModel.value.email,
  //       'currency': 'usd',
  //       'amount': amount,
  //       'items': [
  //         {'id': 'id'}
  //       ],
  //       'request_three_d_secure': 'any',
  //     }),
  //   );
  //   final body = json.decode(responce.body);
  //   if (body['error'] != null) {
  //     throw Exception('Error code: ${body['error']}');
  //   }

  //   return body;
  // }

  // addToCollection({String? paymentStatus, String? paymentId}) {
  //   String id = const Uuid().v1();
  //   firebaseFirestore.collection(collection).doc(id).set({
  //     "id": id,
  //     "clientId": authController.userModel.value.id,
  //     "status": paymentStatus,
  //     "paymentId": paymentId,
  //     "cart": authController.userModel.value.cartItemsToJson(),
  //     "amount": cartController.totalCartPrice.value.toStringAsFixed(2),
  //     "createdAt": DateTime.now().microsecondsSinceEpoch,
  //   });
  // }

  Future<void> pandingOrders() async{
    String id = const Uuid().v1();
    await firebaseFirestore.collection("panding").doc(id).set({
      "id": id,
      "clientId": authController.userModel.value.id,
      "name": {
        "first": authController.userModel.value.name!.first,
        "last": authController.userModel.value.name!.last ?? " ",
      },
      "location": {
        "street": authController.userModel.value.location!.street,
        "city": authController.userModel.value.location!.city,
        "state": authController.userModel.value.location!.state,
        "postcode": authController.userModel.value.location!.postcode,
      },
      "email": authController.userModel.value.email,
      "phone": authController.userModel.value.phone,
      "items": authController.userModel.value.cartItemsToJson(),
      "amount": cartController.totalCartPrice.value.toStringAsFixed(2),
      "createdAt": DateTime.now().microsecondsSinceEpoch,
      "status": "panding"
    });
  }

  Future<void> conformOrder(BuildContext context) async {
    try {
      await pandingOrders();
      await authController.updateUserData({"cart": []});
      Get.to(const MainScreen());
      Get.snackbar('Sccesfull', 'Order succesfully created',
          messageText: const Text('Order succesfully created',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Theme.of(context).colorScheme.background,
          titleText: const Text(
            "Sccesfull",
            style: TextStyle(color: Colors.greenAccent, fontSize: 18),
          ));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  getPaymentHistory() {
    const Loading();
    // payments.clear();
    firebaseFirestore
        .collection(collection)
        .where("clientId", isEqualTo: authController.userModel.value.id)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        PaymentsModel payment = PaymentsModel.fromMap(doc.data());
        payments.add(payment);
      }
    });
  }
}
