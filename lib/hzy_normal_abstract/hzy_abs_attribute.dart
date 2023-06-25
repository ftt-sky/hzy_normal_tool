/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 09:55:21
 * @LastEditors: TT
 * @LastEditTime: 2023-06-25 09:56:24
 */


import 'package:flutter/material.dart';

import '../hzy_normal_config/page_state.dart';

/// 界面通用属性
abstract class HzyAbsAttribute {
  /// 导航栏标题
  final String? title = null;

  /// 导航栏颜色
  final Color? navbackcolor = null;

  /// 默认安全区顶部 忽略
  final bool safeAreatop = true;

  /// 默认安全区底部 忽略
  final bool safeAreabottm = true;

  /// 网络加载状态
  final PageState pageState = PageState.initializedState;

  /// 背景颜色
  final Color? backgroundColor = null;

  /// 是否显示Scaffol脚手架
  final bool isneedScaffol = true;

  /// 滚动属性
  final bool? resizeToAvoidBottomInset = null;

  /// 添加右滑返回拦截器
  final bool isAddPopScope = false;
}
