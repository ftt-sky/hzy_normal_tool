/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 22:09:29
 * @LastEditors: TT
 * @LastEditTime: 2023-03-15 22:09:30
 */
/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2021-12-05 22:04:38
 * @LastEditors: TT
 * @LastEditTime: 2022-08-30 14:45:57
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
