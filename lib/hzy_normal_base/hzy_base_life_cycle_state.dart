/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-22 10:11:48
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 14:39:57
 */
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

abstract class HzyBaseLifeCycleState<T extends StatefulWidget>
    extends HzyBaseState<T> implements HzyNormalLifeCycleAbs {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  /// ------------- 配置监听事件 ---------------- ///
  ///
  ///

  /// app进入前台
  @override
  configAppLifeCycleResumed() {}

  /// app在前台但不响应事件，比如电话，touch id等"
  @override
  configAppLifeCycleInactive() {}

  /// app进入后台
  @override
  configAppLifeCyclePaused() {}

  /// 没有宿主视图但是flutter引擎仍然有效
  @override
  configAppLifeCycleDetached() {}

  /// 主题变更事件回调
  @override
  configPlatformBrightness() {}

  /// 语言发生改变回调
  @override
  configChangeLocales(List<Locale>? locales) {}
}
