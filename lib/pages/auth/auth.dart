import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/controller/appcontroller.dart';
import 'package:royal_designe/widgets/bottom_text.dart';

import 'login.dart';
import 'signup.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({Key? key}) : super(key: key);
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Obx(
          () => Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: .21,
                image: AssetImage("assets/logo.png"),
                
                ),),
          child: Center(
            
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      
                  Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: LoginWidget()),
                  Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child:  RegistrationWidget()),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: _appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () => _appController.changeDIsplayedAuthWidget,
                      text1: "Don't have an account?",
                      text2: 'auth.signUpLabelButton'.tr,
                    ),
                  ),
                  Visibility(
                    visible: !_appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () => _appController.changeDIsplayedAuthWidget,
                      text1: "Have an account ? ",
                      text2: 'auth.signInButton'.tr,
                    ),
                  ),
                ],
              ),
            ),
          ),
          )));
  }
}
