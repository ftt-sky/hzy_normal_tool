import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_place_holder_widget.dart';

import '../hzy_normal_config/page_state.dart';
import '../hzy_normal_widgets/hzy_appbar_generator.dart';

mixin class HzyAbstractWidget {
  /// 创建scaffoll
  Widget createScaffol({
    required BuildContext context,
    bool? safeAreatop,
    bool? safeAreabottm,
    Color? backgroundColor,
    Color? navbackcolor,
    bool? resizeToAvoidBottomInset,
    String? title,
    bool? isneedScaffol = true,
    bool? isAddPopScope = false,
  }) {
    Widget body = isneedScaffol!
        ? Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor,
            appBar: createAppBar(
              context: context,
              title: title,
              navbackcolor: navbackcolor,
            ),
            body: createSafeArea(
              context: context,
              safeAreatop: safeAreatop,
              safeAreabottm: safeAreabottm,
            ),
          )
        : createSafeAreaChildWidget(
            context: context,
          );
    body = isAddPopScope!
        ? WillPopScope(
            child: body,
            onWillPop: () async {
              return configOnWillPop();
            },
          )
        : body;
    return body;
  }

  // -------------- 配置导航栏 -------------- //

  /// 创建导航栏
  PreferredSize? createAppBar({
    required BuildContext context,
    Color? navbackcolor,
    String? title,
  }) {
    if (title != null) {
      return HzyAppBarGenerator.getNoramlAppBar(
        context: context,
        title: title,
        backgroundColor: navbackcolor,
        actions: createAppBaractions(),
        leading: createAppBarleading(),
        textColor: createAppBarTextColor(),
        flexibleSpace: createFlexBleSpace(),
        leadingIconColor: createLeadingIconColor(),
        icon: createLeadIcon(),
        leadingCallback: () {
          configleadingCallbak(context);
        },
        showback: configShowBack(),
        titlew: createAppBarTitleWidget(),
        bottom: createAppBarBottomWidget(),
        prferredheight: configPrferredheight(),
      );
    }
    return null;
  }

  /// 配置返回按钮iconData
  IconData? createLeadIcon() {
    return null;
  }

  /// 自定义appBar title
  Widget? createAppBarTitleWidget() {
    return null;
  }

  /// 设置系统返回按钮 icon 颜色
  Color? createLeadingIconColor() {
    return null;
  }

  /// 设置默认 title 字体颜色
  Color? createAppBarTextColor() {
    return null;
  }

  /// 创建导航栏 右边按钮集合
  List<Widget>? createAppBaractions() {
    return null;
  }

  /// 重写返回按钮控件
  Widget? createAppBarleading() {
    return null;
  }

  /// 配置导航栏背景
  Widget? createFlexBleSpace() {
    return null;
  }

  /// 创建AppBar bottom
  PreferredSizeWidget? createAppBarBottomWidget() {
    return null;
  }

  /// 是否显示返回按钮
  bool configShowBack() {
    return true;
  }

  /// 配置appBar 高度
  double configPrferredheight() {
    return -1;
  }

  // ----------- 创建Widget ----------- //

  /// 创建safe
  Widget createSafeArea({
    required BuildContext context,
    bool? safeAreatop = true,
    bool? safeAreabottm = true,
  }) {
    return SafeArea(
      child: createSafeAreaChildWidget(context: context),
      top: safeAreatop!,
      bottom: safeAreabottm!,
    );
  }

  /// 创建Safe子视图
  createSafeAreaChildWidget({
    required BuildContext context,
  }) {
    Widget body = configIsNeedLayout()
        ? createLayoutWidget(
            context: context,
          )
        : createLayoutChileWidget(
            context: context,
          );
    return body;
  }

  // 创建layout根视图
  createLayoutWidget({
    required BuildContext context,
  }) {
    Widget body = LayoutBuilder(
      builder: (context, constraints) {
        configlayoutbuiderConstraints(constraints);
        return createLayoutChileWidget(
          context: context,
          constraints: constraints,
        );
      },
    );
    return body;
  }

  /// 创建可修改的根视图
  ///
  createLayoutChileWidget({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = Container(
      decoration: configBoxDecoreation(),
      height: configLayoutHeight(),
      width: constraints == null ? null : configSizeBoxWidth(constraints),
      child: createCommBaseWidget(
        constraints: constraints,
        context: context,
      ),
    );
    return body;
  }

  /// 创建通用站位界面
  Widget createCommBaseWidget({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return HzyPlaceHolderWidget(
      pageState: configPageState(),
      errorWidget: createEmptyWidget(),
      loadingWidget: createLoadingWidget(),
      isshowloading: configIsshowLoading(),
      child: createBody(
        constraints: constraints,
        context: context,
      ),
    );
  }

  /// 创建真实body
  @protected
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    throw UnimplementedError();
  }

  /// 创建缺省页
  Widget? createEmptyWidget() {
    return null;
  }

  /// 创建加载界面
  Widget? createLoadingWidget() {
    return null;
  }

  // ----------- 配置项 ---------- //

  /// 配置是否显示加载界面
  bool configIsshowLoading() {
    return false;
  }

  /// 配置是否是WEB
  bool configIsNeedLayout() {
    return false;
  }

  /// 配置是否可以右滑返回
  bool configOnWillPop() {
    return true;
  }

  /// 配置界面状态
  configPageState() {
    return PageState.initializedState;
  }

  /// 配置根视图 装饰器
  configBoxDecoreation() {
    return null;
  }

  /// 配置显示界面最大宽度
  configSizeBoxWidth(constraints) {}

  double? configLayoutHeight() {
    return null;
  }

  /// 获取 屏幕 最大尺寸
  configlayoutbuiderConstraints(BoxConstraints constraints) {}

  // -------------- 点击事件 ------------- //
  /// 点击通用返回按钮点击事件
  configleadingCallbak(
    BuildContext context,
  ) {
    configgoback(context);
  }

  /// 执行返回界面
  configgoback(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }
}
