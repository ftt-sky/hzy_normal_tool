/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 10:05:36
 * @LastEditors: TT-hzy 
 * @LastEditTime: 2024-05-27 09:44:22
 */
import 'package:flutter/material.dart';

import '../hzy_normal_config/page_state.dart';

/// 界面通用属性
mixin class HzyAbsAttribute {
  /// 是否显示导航栏
  final bool isShowAppBar = true;

  /// 导航栏标题
  final String? appBarTitle = null;

  /// 导航栏颜色
  final Color? navBackgroudColor = null;

  /// 默认安全区顶部 忽略
  final bool safeAreaTop = true;

  /// 默认安全区底部 忽略
  final bool safeAreaBottom = true;

  /// 背景颜色
  final Color? scallBackGroundColor = null;

  /// 是否显示Scaffol脚手架
  final bool isNeedScaffol = true;

  /// 是否需要layout
  final bool isNeedLayout = false;

  /// 滚动属性
  final bool? resizeToAvoidBottomInset = null;

  /// 添加右滑返回拦截器
  final bool isAddPopScope = false;
}

mixin class HzyAbsState {
  /// 网络加载状态
  final PageState state = PageState.initializedState;

  /// 是否显示加载动画
  final bool showLoading = false;
}

/// 刷新界面 规范
mixin class HzyAbstracRefreshWidget {
  /// 创建刷新控件
  Widget createRefreshWidget(
    BuildContext context,
  ) {
    throw UnimplementedError();
  }

  /// 创建列表
  Widget createListView(
    BuildContext context,
  ) {
    throw UnimplementedError();
  }

  /// 创建列表 item
  Widget createListitem(
    BuildContext context,
    int index,
  ) {
    throw UnimplementedError();
  }

  /// 创建下啦刷新头部
  createHeader() {
    throw UnimplementedError();
  }

  /// 配置下啦刷新头部字体颜色
  Color? configHeaderTitleColor() {
    return null;
  }

  /// 创建上啦加载更多
  createFooter() {
    throw UnimplementedError();
  }

  /// 配置上啦加载更多字体颜色
  Color? configFooterTitleColor() {
    return null;
  }
}

/// 刷新界面 触发方法
mixin class HzyAbstracRefreshMehod {
  int page = 1;

  void configRefreshController() {}

  /// 结束刷新
  PageState endRefresh({
    required int type,
    required PageState state,
  }) {
    throw UnimplementedError();
  }

  /// 下啦刷新 触发事件
  void configRefresh() {}

  /// 上啦加载 触发事件
  void configLoading() {}
}

// 配置网络请求规范
mixin class HzyAbstractNetWork {
  /// 网络请求
  @protected
  getNetWorkData({
    int? type,
    Map<String, dynamic>? info,
  }) {}
}
