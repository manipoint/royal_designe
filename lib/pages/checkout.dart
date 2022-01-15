import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/widgets/custom_button.dart';
import 'package:royal_designe/widgets/custom_text.dart';
import 'package:royal_designe/widgets/products/custom_item.dart';

import '../responsive.dart';
import 'auth/address.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.location_on,
                          color: Theme.of(context).colorScheme.primaryVariant),
                    ),
                    const Text(
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
                        color: Theme.of(context).colorScheme.primaryVariant,
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
                          authController.userModel.value.location!.postcode!,
                      maxLines: 5,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.to(UserAddress()),
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Responsive.isDesktop(context)
                        ? MediaQuery.of(context).size.shortestSide / 2.4
                        : Responsive.isTablet(context)
                            ? MediaQuery.of(context).size.shortestSide / 1.8
                            : MediaQuery.of(context).size.shortestSide / 1.4,
                    margin: const EdgeInsets.only(top: 20, left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: TextField(
                        controller: authController.phone,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                            fillColor:
                                Theme.of(context).colorScheme.primaryVariant,
                            border: InputBorder.none,
                            hintText: authController.userModel.value.phone,
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryVariant)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => authController
                        .updateUserData({"phone": authController.phone.text}),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryVariant),
                    ),
                  )
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
                          color: Theme.of(context).colorScheme.primaryVariant),
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
                            color: Theme.of(context).colorScheme.primaryVariant,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0))),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
        Obx(() => PositionButton(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            positionBottom: 30,
            positionheight: 40,
            borderRadius: BorderRadius.circular(12.0),
            positionLeft: 60,
            positionRight: 60,
            containerWidth: 100,
            onTab: () {
              if (authController.userModel.value.location!.city!.isNotEmpty &&
                  authController.userModel.value.location!.street!.isNotEmpty &&
                  cartController.quantatyInCart.value >= 1) {
                paymentController.conformOrder(context);
              } else {
                Get.snackbar(
                    "Error", "Kindly Update your address or Add items to cart",
                    backgroundColor: Theme.of(context).colorScheme.background,
                    titleText: Text(
                      "Error",
                      style: TextStyle(
                          color: Theme.of(context).errorColor, fontSize: 18),
                    ));
              }
            },
            text: "Pay ${cartController.totalCartPrice.value}")),
      ],
    ));
  }
}
//   Widget confirmButton(context) {
//     return Positioned(
//        left: MediaQuery.of(context).size.width / 8,
//         right: MediaQuery.of(context).size.width / 8,
//         bottom: 10,
//       child: InkWell(
//           onTap: () {
//             if (authController.userModel.value.location!.city!.isNotEmpty &&
//                 authController.userModel.value.location!.street!.isNotEmpty &&
//                 cartController.quantatyInCart.value >= 1) {
//               paymentController.conformOrder(context);
//             } else {
//               Get.snackbar(
//                   "Error", "Kindly Update your address or Add items to cart",
//                   backgroundColor: Theme.of(context).colorScheme.background,
//                   titleText: Text(
//                     "Error",
//                     style: TextStyle(
//                         color: Theme.of(context).errorColor, fontSize: 18),
//                   ));
//             }
//           },
    
//           //onTap: () => Get.to(() => const PaymentSheetScreen()),
//           child: Obx(
//             () => Container(
//               decoration: BoxDecoration(
//                     gradient: AppThemes.mainButton,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.16),
//                         offset: Offset(0, 5),
//                         blurRadius: 10.0,
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(9.0)),
//               width: MediaQuery.of(context).size.width / 1.3,
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 margin: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).padding.bottom == 0
//                         ? 20
//                         : MediaQuery.of(context).padding.bottom),
//               child: Center(
//                   child: Text(
//                       "Pay ${cartController.totalCartPrice.toString().obs}",
//                       style: const TextStyle(
//                           color: Color(0xfffefefe),
//                           fontWeight: FontWeight.w600,
//                           fontStyle: FontStyle.normal,
//                           fontSize: 20.0))),
//             ),
//           )),
//     );
//   }
// }

// class PaymentSheetScreen extends StatelessWidget {
//   const PaymentSheetScreen({Key? key}) : super(key: key);

//   continued() async {
//     switch (paymentController.step.value) {
//       case 0:
//         {
//           await paymentController.initPaymentSheet();

//           return;
//         }

//       case 1:
//         {
//           await paymentController.presentPaymentSheet();

//           return;
//         }

//       case 2:
//         {
//           await paymentController.confirmPayment();
//           paymentController.step.value = 0;
//         }
//         break;
//       default:
//         paymentController.step.value = 0;
//     }
//   }

//   cancel() {
//     paymentController.step.value > 0 ? paymentController.step.value -= 1 : null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PaymentOption(
//       tags: const ['Single Step'],
//       children: [
//         Obx(
//           () => Theme(
//             data: ThemeData(
//               colorScheme:
//                   ColorScheme.light(primary: Colors.deepOrange.shade700),
//             ),
//             child: Stepper(
//                 onStepCancel: cancel,
//                 onStepContinue: continued,
//                 currentStep: paymentController.step.value,
//                 steps: [
//                   Step(
//                     isActive: paymentController.step.value >= 0,
//                     state: paymentController.step.value >= 0
//                         ? StepState.complete
//                         : StepState.disabled,
//                     title: const Text('Init Payment'),
//                     content: LoadingButton(
//                       key: key,
//                       onPressed: paymentController.initPaymentSheet,
//                       text: 'Init Payment sheet',
//                     ),
//                   ),
//                   Step(
//                     isActive: paymentController.step.value >= 1,
//                     state: paymentController.step.value >= 2
//                         ? StepState.complete
//                         : StepState.disabled,
//                     title: const Text('Select payment method'),
//                     content: LoadingButton(
//                       onPressed: paymentController.presentPaymentSheet,
//                       text: 'Select payment method',
//                     ),
//                   ),
//                   Step(
//                     isActive: paymentController.step.value >= 2,
//                     state: paymentController.step.value == 3
//                         ? StepState.complete
//                         : StepState.disabled,
//                     title: Text(
//                         'Pay ${cartController.totalCartPrice.toString().obs}'),
//                     content: LoadingButton(
//                       onPressed: paymentController.confirmPayment,
//                       text: 'Pay now',
//                     ),
//                   ),
//                 ]),
//           ),
//         )
//       ],
//     );
//   }
// }
