import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/widgets/badge.dart';
import 'package:royal_designe/widgets/custom_text.dart';
import 'package:royal_designe/widgets/products/custom_item.dart';

import '../responsive.dart';
import 'auth/address.dart';
import 'notifications.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget confirmButton = Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("You have Selected totle",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0)),
              Obx(() => Text("${cartController.quantatyInCart} Item'(s) ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Your totle cart price is Rs",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0)),
              Obx(() => Text("${cartController.totalCartPrice.value}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                  "Pay Rs ${cartController.totalCartPrice.value} when parcel Arrive",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0))),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    if (authController
                            .userModel.value.location!.city!.isNotEmpty &&
                        authController
                            .userModel.value.location!.street!.isNotEmpty &&
                        cartController.quantatyInCart.value >= 1) {
                      paymentController.conformOrder(context);
                    } else {
                      Get.snackbar("Error",
                          "Kindly Update your address or Add items to cart",
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          titleText: Text(
                            "Error",
                            style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 18),
                          ));
                    }
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 2.0, bottom: 2, left: 8, right: 8),
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 16),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: const Text(
            "Item Details",
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const IconBadge(
                icon: Icons.notifications,
                size: 22.0,
              ),
              onPressed: () => Get.to(const Notifications()),
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: CustomText(
                      text: "Shopping Cart",
                      size: 24,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.location_on),
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListTile(
                        title: Text(
                          authController.userModel.value.name!.first!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          authController.userModel.value.location!.street! +
                              " " +
                              authController.userModel.value.location!.city! +
                              " " +
                              authController.userModel.value.location!.state! +
                              " " +
                              authController
                                  .userModel.value.location!.postcode!,
                          maxLines: 5,
                        ),
                        trailing: IconButton(
                          onPressed: () => Get.to(UserAddress()),
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Container(
                            width: Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.shortestSide / 2
                                : Responsive.isTablet(context)
                                    ? MediaQuery.of(context).size.shortestSide /
                                        1.6
                                    : MediaQuery.of(context).size.shortestSide /
                                        1.2,
                            //margin: const EdgeInsets.only(top: 20,left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: TextField(
                                controller: authController.phone,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.phone),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText:
                                        authController.userModel.value.phone),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => authController.updateUserData(
                            {"phone": authController.phone.text}),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Row(
                      children: [
                        const Text(
                          "To",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          " CUSTOMIZE ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.error),
                        ),
                        const Text(
                          " please click on image",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() => Column(
                        children: [
                          Column(
                              children:
                                  authController.userModel.value.cart!.map((e) {
                            return CustomItem(
                              cartItem: e,
                            );
                          }).toList()),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  confirmButton,
                ],
              ),
            ),
          ],
        ));
  }
}
