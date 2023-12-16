// 通用 字体
import 'package:flutter/material.dart';

class HzyTextStyle {
  static TextStyle fontRegular({
    double? size,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return configNormalTextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle fontMedium({
    double? size,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return configNormalTextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  static TextStyle fontSemi({
    double? size,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return configNormalTextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
      fontFamily: fontFamily,
      decoration: decoration,
    );
  }

  static TextStyle fontLight({
    double? size,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return configNormalTextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle fontBold({
    double? size,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return configNormalTextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle configNormalTextStyle({
    double? fontSize,
    Color? color,
    double? height,
    FontWeight? fontWeight,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      height: height,
      decoration: decoration,
    );
  }
}
