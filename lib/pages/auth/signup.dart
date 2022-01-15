import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/custom_row.dart';
import 'package:royal_designe/widgets/custom_button.dart';

import '../../responsive.dart';

class RegistrationWidget extends StatelessWidget {
  RegistrationWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.shortestSide / 2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.shortestSide / 1.6
              : MediaQuery.of(context).size.shortestSide / 1.2,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: const [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Form(
            key: _formKey,
            child: Wrap(
              children: [
                CustomRow(
                    obscureText: false,
                    icon: const Icon(Icons.person),
                    controller: authController.firstName,
                    hint: "auth.firstNameFormField".tr +
                        " " +
                        "auth.nameFormField".tr,
                    validatorText: "Please Enter First Name"),
                CustomRow(
                  obscureText: false,
                  icon: const Icon(Icons.person),
                  controller: authController.lastName,
                  hint: "auth.lastNameFormField".tr +
                      " " +
                      "auth.nameFormField".tr,
                  validatorText: "please Enter auth.lastNameFormField".tr +
                      " " +
                      "auth.nameFormField".tr,
                ),
                CustomRow(
                    obscureText: false,
                    icon: const Icon(Icons.email_outlined),
                    controller: authController.email,
                    hint: 'auth.emailFormField'.tr,
                    validatorText: "Please Enter Email Address"),
                CustomRow(
                    obscureText: true,
                    icon: const Icon(Icons.lock),
                    controller: authController.password,
                    hint: "auth.passwordFormField".tr,
                    validatorText: "Please Enter Password"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                  width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.shortestSide / 2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.shortestSide / 1.6
              : MediaQuery.of(context).size.shortestSide / 1.2,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Re-Enter Password";
                            }
                            if (authController.password.text !=
                                authController.confirmPassword.text) {
                              authController.passwordClear();
                              return "Password does not match";
                            }
                            return null;
                          },
                          controller: authController.confirmPassword,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Re-Enter Password"),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomRow(
                    obscureText: false,
                    icon: const Icon(Icons.phone),
                    controller: authController.phone,
                    hint: "home.phone".tr,
                    validatorText: "Please Enter Cell Number"),
              ],
            ),
          ),
          PositionButton(
            borderRadius: BorderRadius.circular(15),
            color: AppThemes.whiteLilac,
            positionheight:
                Responsive.isDesktop(context) || Responsive.isTablet(context)
                    ? 60
                    : MediaQuery.of(context).size.longestSide / 16,
            positionLeft: MediaQuery.of(context).size.longestSide / 16,
            positionRight: MediaQuery.of(context).size.longestSide / 16,
            positionBottom: 4,
            onTab: () {
              if (_formKey.currentState!.validate()) {
                authController.signUp();
              }
            },
            text: 'auth.signUpButton'.tr,
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';

// import 'package:royal_designe/constants/controllers.dart';
// import 'package:royal_designe/util/app_themes.dart';
// import 'package:royal_designe/widgets/custom_button.dart';

// import '../../responsive.dart';

// class RegistrationWidget extends StatelessWidget {
//   const RegistrationWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide /2:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.6
//                   : MediaQuery.of(context).size.shortestSide/1.2,
//       margin: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//           color: Colors.transparent,
//           boxShadow:  const[
//             BoxShadow(
//               color: Colors.transparent,
//               blurRadius: 10,
//             )
//           ],
//           borderRadius: BorderRadius.circular(20)),
//       child: Wrap(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                    width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide / 2.4:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.8
//                   : MediaQuery.of(context).size.shortestSide/1.2,
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color:Theme.of(context).colorScheme.onBackground,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: TextField(
//                     style: TextStyle(color: Theme.of(context).colorScheme.primaryVariant,),
//                     controller: authController.firstName,
//                     decoration: InputDecoration(
                      
//                         icon: const Icon(Icons.person),
//                        fillColor: Theme.of(context).colorScheme.primaryVariant,
//                         border: InputBorder.none,
//                         hintText: "auth.firstNameFormField".tr + " " + "auth.nameFormField".tr,
//                         hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                      width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide / 2.4:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.8
//                   : MediaQuery.of(context).size.shortestSide/1.2,
              
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                  color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: TextField(
//                     controller: authController.lastName,
//                     decoration:  InputDecoration(
//                         icon: const Icon(Icons.person),
//                      fillColor: Theme.of(context).colorScheme.primaryVariant,
//                         border: InputBorder.none,
//                         hintText: "auth.lastNameFormField".tr+ " " +"auth.nameFormField".tr,
//                         hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                       width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide / 2.4:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.8
//                   : MediaQuery.of(context).size.shortestSide/1.2,
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                  color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: TextField(
//                     controller: authController.email,
//                     decoration: InputDecoration(
//                         icon: const Icon(Icons.email_outlined),
//                         fillColor: Theme.of(context).colorScheme.primaryVariant,
//                         border: InputBorder.none,
//                         hintText: 'auth.emailFormField'.tr,
//                         hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                          width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide / 2.4:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.8
//                   : MediaQuery.of(context).size.shortestSide/1.2,
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   boxShadow: AppThemes.shadow,
//                   borderRadius: BorderRadius.circular(25),
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: TextField(
//                     obscureText: true,
//                     controller: authController.password,
//                     decoration: InputDecoration(
//                         icon: const Icon(Icons.lock),
//                         fillColor: Theme.of(context).colorScheme.primaryVariant,
//                         border: InputBorder.none,
//                         hintText: "auth.passwordFormField".tr,
//                         hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                      width: Responsive.isDesktop(context) ?
//               MediaQuery.of(context).size.shortestSide / 2.4:
//                Responsive.isTablet(context)
//                   ? MediaQuery.of(context).size.shortestSide/1.8
//                   : MediaQuery.of(context).size.shortestSide/1.2,
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                  color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: TextField(
                
//                     controller: authController.phone,
//                     decoration: InputDecoration(
//                         icon: const Icon(Icons.phone),
//                         fillColor: Theme.of(context).colorScheme.primaryVariant,
//                         border: InputBorder.none,
//                         hintText: "home.phone".tr,
//                         hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(25),
//             child: CustomButton(
                
//                 bgColor: Theme.of(context).colorScheme.secondary,
//                 text: 'auth.signUpButton'.tr,
//                 onTap: () => authController.signUp),
//           )
//         ],
//       ),
//     );
//   }
// }
