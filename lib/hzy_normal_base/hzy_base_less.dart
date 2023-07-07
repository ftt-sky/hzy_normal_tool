/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-24 21:12:39
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 14:42:40
 */

import 'package:flutter/material.dart';

import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseLess extends StatelessWidget
    with
        HzyAbstractWidget,
        HzyAbstractAttribute,
        HzyAbstractNetWork,
        WidgetsBindingObserver {
  HzyBaseLess({super.key});

  @override
  bool get safeAreabottm => false;

  /// =============== UI配置 =============== ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      interfaceRenderingCompleted();
    });
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
  /// 界面渲染完成
  interfaceRenderingCompleted() {}
}
