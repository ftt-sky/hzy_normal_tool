/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-16 17:37:21
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 14:53:19
 */

import 'package:flutter/cupertino.dart';
import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseState<T extends StatefulWidget> extends State<T>
    with
        HzyAbstractWidget,
        HzyAbstractAttribute,
        HzyAbstractNetWork,
        WidgetsBindingObserver {
  String? errMsg;
  late BuildContext? buildContext;
  bool isNeedSuperBuild = false;

  /// 界面初始化完成
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      interfaceRenderingCompleted();
    });
    Future.delayed(Duration.zero).then((value) {
      initDefaultState();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return configBuild(context);
  }

  Widget configBuild(BuildContext context) {
    buildContext = context;
    Widget widget = createScaffol(
      context: context,
      safeAreatop: safeAreatop,
      safeAreabottm: safeAreabottm,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      title: title,
      backgroundColor: backgroundColor,
      navbackcolor: navbackcolor,
      isneedScaffol: isneedScaffol,
      isAddPopScope: isAddPopScope,
    );
    return widget;
  }

  /// =============== UI配置 =============== ///
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

  /// 界面进入
  void initDefaultState() {}

  /// 界面渲染完成
  void interfaceRenderingCompleted() {}

  /// 界面销毁
  void initDefaultDispose() {}

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
