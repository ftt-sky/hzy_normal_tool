/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-16 17:37:21
 * @LastEditors: TT
 * @LastEditTime: 2023-03-21 18:09:30
 */

import 'package:flutter/cupertino.dart';
import 'package:hzy_normal_tool/hzy_normal_base/hzy_normal_base_index.dart';

import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseState<T extends StatefulWidget> extends State<T>
    with HzyAbstractWidget, HzyAbstractAttribute {
  HzyBaseVM vm = HzyBaseVM();

  /// 界面初始化完成
  @override
  void initState() {
    initDefaultState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

  @override
  bool configIsNeedLayout() {
    return false;
  }

  @override
  bool configIsshowLoading() {
    return vm.config.isShowLoading;
  }

  @override
  configPageState() {
    return vm.config.pageState;
  }

  @override
  bool configOnWillPop() {
    return true;
  }

  @override
  void dispose() {
    initDefaultDispose();
    super.dispose();
  }

  void configReload() {
    setState(() {});
  }

  /// 界面进入
  void initDefaultState() {
    configVMReload();
  }

  configVMReload() {
    vm.reload = () {
      configReload();
    };
  }

  /// 界面销毁
  void initDefaultDispose() {}
}
