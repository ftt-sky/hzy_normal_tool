import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_place_holder_widget.dart';

import '../hzy_normal_config/page_state.dart';
import '../hzy_normal_widgets/hzy_appbar_generator.dart';

abstract class HzyAbstractWidget {
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
              safeAreatop: safeAreatop,
              safeAreabottm: safeAreabottm,
            ),
          )
        : createSafeAreaChildWidget();
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
        leadingIconColor: createLeadingIconColor(),
        leadingCallback: () {
          configleadingCallbak(context);
        },
        titlew: createAppBarTitleWidget(),
        bottom: createAppBarBottomWidget(),
      );
    }
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

  /// 创建AppBar bottom
  PreferredSizeWidget? createAppBarBottomWidget() {
    return null;
  }

  // ----------- 创建Widget ----------- //

  /// 创建safe
  Widget createSafeArea({
    bool? safeAreatop = true,
    bool? safeAreabottm = true,
  }) {
    return SafeArea(
      child: createSafeAreaChildWidget(),
      top: safeAreatop!,
      bottom: safeAreabottm!,
    );
  }

  /// 创建Safe子视图
  createSafeAreaChildWidget() {
    Widget body = configIsNeedLayout()
        ? createWebBodyWidget()
        : createLayoutChileWidget();
    return body;
  }

  // 创建WEB根视图
  createWebBodyWidget() {
    Widget body = createLayoutWidget();
    return body;
  }

  // 创建layout根视图
  createLayoutWidget() {
    Widget body = LayoutBuilder(
      builder: (context, constraints) {
        configlayoutbuiderConstraints(constraints);
        return createLayoutChileWidget(
          constraints: constraints,
        );
      },
    );
    return body;
  }

  /// 创建可修改的根视图
  ///
  createLayoutChileWidget({
    BoxConstraints? constraints,
  }) {
    Widget body = Container(
      decoration: configBoxDecoreation(),
      width: constraints == null ? null : configSizeBoxWidth(constraints),
      child: createCommBaseWidget(constraints: constraints),
    );
    return body;
  }

  /// 创建通用站位界面
  Widget createCommBaseWidget({
    BoxConstraints? constraints,
  }) {
    return HzyPlaceHolderWidget(
      pageState: configPageState(),
      errorWidget: createEmptyWidget(),
      loadingWidget: createLoadingWidget(),
      isshowloading: configIsshowLoading(),
      child: createBody(constraints: constraints),
    );
  }

  /// 创建头部
  Widget createHeaderWidget() {
    return Container();
  }

  /// 创建真实body
  @protected
  Widget createBody({
    BoxConstraints? constraints,
  });

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
