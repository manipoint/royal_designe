import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final Function onTap;
  final String? text1;
  final String? text2;


  const BottomTextWidget({Key? key, required this.onTap, required this.text1, this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      GestureDetector(
      onTap: onTap(),
      child: RichText(text: TextSpan(children: [
        TextSpan(text: text1, style:  TextStyle(color: Theme.of(context).colorScheme.primaryVariant,fontSize: 16)),
        TextSpan(text: " $text2", style: const TextStyle(color: Colors.blue,fontSize: 18))

      ])),
    );
  }
}