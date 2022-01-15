import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/custom_row.dart';
import 'package:royal_designe/widgets/custom_button.dart';

import '../../responsive.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.9,
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.shortestSide / 2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.shortestSide / 1.6
              : MediaQuery.of(context).size.shortestSide / 1.2,
      margin: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: const [
            BoxShadow(
              color: Colors.transparent,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Form(
            key: _formKey,
            child: Wrap(
              children: [
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
         
            positionBottom: 50,
            onTab: () => _formKey.currentState!.validate()
                ? authController.signIn()
                : Get.snackbar('auth.signInButton'.tr, "Enter All Field"),
            text: 'auth.signInButton'.tr,
          ),
        ],
      ),
    );
  }
}
