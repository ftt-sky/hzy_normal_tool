/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 22:12:07
 * @LastEditors: TT
 * @LastEditTime: 2023-03-15 22:12:27
 */


import 'package:flutter/material.dart';

abstract class AbsThemeColorConfig {
  Map<String, Color?> lightInfo = {};
  Map<String, Color?> darkInfo = {};
  Color confgColor(String colkey, {bool reversal = false}) {
    bool isbackmodel = loadThemeModel();
    if (reversal) {
      isbackmodel = !isbackmodel;
    }
    Map colorinfo = isbackmodel ? darkInfo : lightInfo;
    return colorinfo[colkey] ?? Colors.black;
  }

  bool loadThemeModel() {
    return false;
  }
}


abstract class AbsThemeImagePathConfig {
  Map<String, String> get lightInfo => {};
  Map<String, String> get darkInfo => {};

  String configImagePath({
    required String pathkey,
    bool? reversal = false,
  }) {
    bool isbackModel = loadThemeModel();
    if (reversal!) {
      isbackModel = !isbackModel;
    }
    Map imagePathInfo = isbackModel ? darkInfo : lightInfo;
    return imagePathInfo[pathkey] ?? "";
  }

  bool loadThemeModel() {
    return false;
  }
}
