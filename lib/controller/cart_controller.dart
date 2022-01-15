import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/model/product_model.dart';
import 'package:royal_designe/model/user_model.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();

  Rx<CartModel> cartModel = CartModel().obs;
  Rx<double> totalCartPrice = 0.0.obs;
  RxInt quantaty = 1.obs;
  Rx<int> quantatyInCart = 0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(authController.userModel, changeCartTotalPrice);
    ever(authController.userModel, changeCartTotalquantity);
    ever(cartController.cartModel, decreaseQuantity);
    ever(cartController.cartModel, increaseQuantity);
  }

  addProductToCart(ProductModel product, BuildContext context) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added",
            backgroundColor: Theme.of(context).colorScheme.background,
            titleText: Text(
              "Check your cart",
              style:
                  TextStyle(color: Theme.of(context).errorColor, fontSize: 18),
            ));
      } else {
        String itemId = const Uuid().v1();
        authController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": quantaty.toInt(),
              "price": product.price,
              "picture": product.picture,
              "cost": product.price! * quantaty.value
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart",
            messageText: Text("${product.name} was added to your cart",
                style: const TextStyle(color: Colors.black)),
            backgroundColor: Theme.of(context).colorScheme.background,
            titleText: const Text(
              "Sccesfull",
              style: TextStyle(color: Colors.greenAccent, fontSize: 18),
            ));
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item",
          backgroundColor: Theme.of(context).colorScheme.background,
          titleText: Text(
            "Error",
            style: TextStyle(color: Theme.of(context).errorColor, fontSize: 18),
          ));
      debugPrint(e.toString());
    }
  }

  void removeCartItem(
    CartModel cartItem,
  ) {
    try {
      authController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item + ${e.toString()}",
          backgroundColor: Colors.white,
          titleText: const Text(
            "Error",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ));
      debugPrint(e.toString());
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart!.isNotEmpty) {
      for (var cartItem in authController.userModel.value.cart!) {
        totalCartPrice.value += cartItem.price! * cartItem.quantity!;
      }
    }
  }

  changeCartTotalquantity(UserModel userModel) {
    quantatyInCart.value = 0;
    if (userModel.cart!.isNotEmpty) {
      for (var cartItem in authController.userModel.value.cart!) {
        quantatyInCart.value += cartItem.quantity!;
      }
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      authController.userModel.value.cart!
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  Future<void> decreaseQuantity(CartModel item) async {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      //print("before decrese ${item.quantity}");
      quantaty.value = item.quantity!;
      quantaty.value--;
      //update quantity every time
      item.quantity = quantaty.value;
      //update price every time when quantity increase or decrease
      item.cost = item.price! * item.quantity!;

      //print("After decrese ${item.quantity!}");
      authController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
    quantaty.value = 1;
  }

  void increaseQuantity(CartModel item) {
    removeCartItem(item);
    quantaty.value = item.quantity!;
    quantaty.value++;
    item.quantity = quantaty.value;

    item.cost = item.price! * item.quantity!;
    authController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
    quantaty.value = 1;
  }

  buyProduct(ProductModel product, BuildContext context, String? fileName,
      String? pathName) async {
    try {
      String mediaUrl = await productController.uploadImageFile(
          productController.xFile.value!, fileName, pathName);
      String itemId = const Uuid().v1();
      if (_isItemAlreadyAdded(product)) {
       
      } else {
        authController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "customName": authController.customName.text,
              "discription": authController.customDis.text,
              "quantity": quantaty.toInt(),
              "price": product.price,
              "picture": mediaUrl,
              "cost": product.price! * quantaty.value
            }
          ])
        });

      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item",
          backgroundColor: Theme.of(context).colorScheme.background,
          titleText: Text(
            "Error",
            style: TextStyle(color: Theme.of(context).errorColor, fontSize: 18),
          ));
      debugPrint(e.toString());
    }
  }
}
