/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 10:05:36
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 15:49:14
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
  final bool safeAreatop = true;

  /// 默认安全区底部 忽略
  final bool safeAreabottm = true;

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

abstract class HzyAbsState {
  /// 网络加载状态
  final PageState state = PageState.initializedState;

  /// 是否显示加载动画
  final bool showLoading = false;
}
