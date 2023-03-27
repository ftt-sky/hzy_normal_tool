/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-24 21:12:39
 * @LastEditors: TT
 * @LastEditTime: 2023-03-27 16:16:34
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseLess extends StatelessWidget
    with HzyAbstractWidget, HzyAbstractAttribute, HzyAbstractNetWork {
  HzyBaseLess({super.key});

  /// =============== UI配置 =============== ///
  @override
  Widget build(BuildContext context) {
    Widget body = createScaffol(
      context: context,
      safeAreatop: safeAreatop,
      safeAreabottm: safeAreabottm,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      title: title,
      backgroundColor: backgroundColor,
      navbackcolor: navbackcolor,
      isAddPopScope: isAddPopScope,
      isneedScaffol: isneedScaffol,
    );
    return body;
  }

  @override
  bool configIsNeedLayout() {
    return false;
  }

  @override
  bool configIsshowLoading() {
    return false;
  }

  @override
  configPageState() {
    return pageState;
  }

  @override
  bool configOnWillPop() {
    return true;
  }

  /// =============== 网络事件 =============== ///
  @override
  Map<String, dynamic>? configNetWorkParmas(
      {String? mark, Map<String, dynamic>? params}) {
    return null;
  }

  @override
  getnetworkdata({int? type, Map<String, dynamic>? info}) async {}

  /// =============== 触发事件 =============== ///
}
