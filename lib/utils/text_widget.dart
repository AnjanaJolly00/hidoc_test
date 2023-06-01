import 'package:flutter/material.dart';

class TextWidget {
  static muliLightText(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      double? letterSpacing = 0}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        letterSpacing: letterSpacing,
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  static muliBoldText(
      {String? text,
      Color? color,
      double? height,
      double? fontSize,
      TextAlign? textAlign,
      int? maxLines = 2,
      double? letterSpacing = 0}) {
    return Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static muliExtraBoldText(
      {String? text,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      int? maxLines = 2,
      double? letterSpacing = 0}) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          letterSpacing: letterSpacing,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w900),
      maxLines: maxLines,
    );
  }

  static muliRegularText(
      {String? text,
      int? maxLines = 10,
      Color? color,
      double? fontSize,
      TextAlign? textAlign,
      double? height = 1.5,
      double? letterSpacing = 0}) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.clip,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300,
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  static muliSemiBoldText(
      {String? text,
      Color? color,
      double? fontSize,
      FontStyle? fontStyle,
      TextDecoration? decoration,
      TextAlign? textAlign,
      double? letterSpacing = 0}) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontStyle: fontStyle ?? FontStyle.normal,
        color: color,
        fontSize: fontSize,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: FontWeight.w500,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static outLineText({
    String? text,
    Color? color,
    double? fontSize,
    TextAlign? textAlign,
    double? letterSpace,
  }) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpace ?? 8,
      ),
    );
  }
}
