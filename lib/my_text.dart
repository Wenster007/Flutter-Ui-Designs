import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.color,
    this.maxLines,
    this.wordSpacing,
    this.fontFamily, this.textAlign,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final Color? color;
  final int? maxLines;
  final double? wordSpacing;
  final String? fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: wordSpacing,
        fontSize: fontSize ?? Get.height * 0.024,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: overflow,
        color: color,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
    );
  }
}
