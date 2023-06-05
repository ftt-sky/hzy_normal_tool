/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-16 17:37:21
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 22:45:07
 */

import 'package:flutter/cupertino.dart';
import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseState<T extends StatefulWidget> extends State<T>
    with
        HzyAbstractWidget,
        HzyAbstractAttribute,
        HzyAbstractNetWork,
        WidgetsBindingObserver {
  /// 失败描述语
  String? errMsg;

  /// 当前content
  late BuildContext? buildContext;

  /// 是否显示加载动画
  bool isShowLoading = false;

  /// 是否需要LayoutBuild
  bool isNeedLayout = false;

  /// 是否关闭底部安全区域
  @override
  bool get safeAreabottm => false;

  /// 配置导航栏字体
  @override
  String? get title => configAppBarTitle();

  /// 界面初始化完成
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      initDefaultState();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      interfaceRenderingCompleted();
    });
    super.initState();
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

  /// 是否使用LayoutBuild
  @override
  bool configIsNeedLayout() {
    return isNeedLayout;
  }

  /// 是否显示加载动画
  @override
  bool configIsshowLoading() {
    return isShowLoading;
  }

  /// 配置界面状态
  @override
  configPageState() {
    return pageState;
  }

  /// 是否关闭右滑返回
  @override
  bool configOnWillPop() {
    return true;
  }

  /// 配置导航栏文字
  String? configAppBarTitle() {
    return null;
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
