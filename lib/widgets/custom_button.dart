import 'package:flutter/material.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? shadowColor;
  final Function onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: PhysicalModel(
        color: Colors.grey.withOpacity(.4),
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: bgColor ?? Colors.black,
            ),
            child: Container(
              margin: const EdgeInsets.all(14),
              alignment: Alignment.center,
              child: CustomText(
                text: text,
                color: txtColor ?? Colors.white,
                size: 22,
                weight: FontWeight.normal,
              ),
            )),
      ),
    );
  }
}

class PositionButton extends StatelessWidget {
  final Function() onTab;
  final double? positionLeft;
  final double? positionTop;
  final double? positionRight;
  final double? positionBottom;
  final double? positionWidth;
  final double? positionheight;
  final double? containerWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String text;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  const PositionButton({
    Key? key,
    required this.onTab,
    this.containerWidth,
    this.padding,
    this.margin,
    required this.text,
    this.fontWeight,
    this.fontStyle,
    this.fontSize = 16,
    this.borderRadius,
    this.positionLeft,
    this.positionTop,
    this.positionRight,
    this.positionBottom,
    this.positionWidth,
    this.positionheight, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: positionLeft,
        right: positionRight,
        bottom: positionBottom,
        width: positionWidth,
        height: positionheight,
        child: InkWell(
          onTap: onTab,
          child: Container(
            width: containerWidth,
            padding: padding,
            margin: margin,
            child: Center(
                child: Text(text,
                    style: TextStyle(
                        color: color,
                        fontWeight: fontWeight,
                        fontStyle: fontStyle,
                        fontSize: fontSize))),
            decoration: BoxDecoration(
                gradient: AppThemes.mainButton,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: borderRadius),
          ),
        ));
  }
}
