/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 16:51:23
 * @LastEditors: TT
 * @LastEditTime: 2023-10-04 19:37:40
 */

import 'package:flutter/material.dart';
/*
  回到根视图
  根据路由名字
*/

jumpToRootWithNamePage({
  required BuildContext context,
  bool isPop = true,
  String name = "/",
}) {
  if (isPop) {
    return Navigator.popUntil(
      context,
      ModalRoute.withName(
        name,
      ),
    );
  } else {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      (route) => false,
    );
  }
}

jumpToRootPage({
  required BuildContext context,
  bool isPop = true,
  String name = "/",
  Widget? widget,
  Object? arguments,
}) {
  if (isPop) {
    return Navigator.popUntil(
      context,
      ModalRoute.withName(
        name,
      ),
    );
  } else {
    if (widget != null) {
      return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ), (route) => false);
    } else {
      return Navigator.pushNamedAndRemoveUntil(
        context,
        name,
        (route) => false,
        arguments: arguments,
      );
    }
  }
}

/// 获取路由跳转传惨
configPageArguments({required BuildContext context}) {
  return ModalRoute.of(context)?.settings.arguments;
}
