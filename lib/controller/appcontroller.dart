import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isLoginWidgetDisplayed = false.obs;
  RxBool isPayment = false.obs;

  changeDIsplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  changeDIsplayedPaymentWidget() {
    if(authController.userModel.value.cart == null) {
      isPayment.value = !isPayment.value;
    }
  }
}
