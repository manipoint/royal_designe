import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royal_designe/constants/controllers.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/custom_row.dart';
import 'package:royal_designe/util/loading_icon.dart';
import 'package:royal_designe/widgets/custom_button.dart';

class UserAddress extends StatelessWidget {
  UserAddress({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Add/Edit Address",
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
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
                      icon: const Icon(Icons.living_sharp),
                      controller: authController.street,
                      hint: "Address",
                      validatorText: "Address Line 1"),
                  CustomRow(
                      obscureText: false,
                      icon: const Icon(Icons.location_city),
                      controller: authController.city,
                      hint: "City",
                      validatorText: 'Please enter your City'),
                  CustomRow(
                      obscureText: false,
                      icon: const Icon(Icons.location_on),
                      controller: authController.state,
                      hint: "state/Provence",
                      validatorText: 'Please enter your state/provence'),
                  CustomRow(
                      obscureText: false,
                      icon: const Icon(Icons.post_add),
                      controller: authController.postcode,
                      hint: "Post code",
                      validatorText: 'Please enter Postcode'),
                ],
              ),
            ),
            PositionButton(
              borderRadius: BorderRadius.circular(15),
              color: AppThemes.whiteLilac,
              positionheight: 60,
              positionLeft: MediaQuery.of(context).size.width / 8,
              positionRight: MediaQuery.of(context).size.width / 8,
              positionBottom: 60,
              onTab: () {
                if (_formKey.currentState!.validate()) {
                  const Loading();
                  authController.updateUserAddress();
                  Navigator.pop(context);
                  Get.snackbar('Address', "Address Updated");
                } else {
                  Get.snackbar('Address', "Enter All Field");
                }
              },
              text: 'Conirm',
            ),
          ],
        ),
      ),
    );
  }
}
