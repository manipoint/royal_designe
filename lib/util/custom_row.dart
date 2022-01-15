import 'package:flutter/material.dart';

import '../responsive.dart';

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  final TextEditingController controller;
  final String validatorText;
  final String hint;
  final Icon? icon;
  bool? obscureText = false;

  CustomRow({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon,
    required this.validatorText,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextFormField(
              obscureText: obscureText!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
                return null;
              },
              controller: controller,
              decoration: InputDecoration(
                  icon: icon,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: hint),
            ),
          ),
        ),
      ],
    );
  }
}
// ignore: must_be_immutable
class CustomPasswordValidatorRow extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon? icon;
  final String? Function(String?)? validator;
  bool? obscureText = false;

  CustomPasswordValidatorRow ({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon,
    this.obscureText, required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextFormField(
              obscureText: obscureText!,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                  icon: icon,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: hint),
            ),
          ),
        ),
      ],
    );
  }
}
