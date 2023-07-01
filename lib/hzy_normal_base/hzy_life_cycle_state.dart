/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 10:22:23
 * @LastEditors: TT
 * @LastEditTime: 2023-06-25 10:24:03
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_base/hzy_state.dart';

import '../hzy_normal_abstract/hzy_normal_life_cycle_abs.dart';
import '../hzy_normal_tools/hzy_normal_tools.dart';

abstract class HzyLifeCycleState<T extends StatefulWidget> extends HzyState<T>
    with HzyNormalLifeCycleAbs {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Future<bool> didPopRoute() {
    dprint("idPopRoute");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    dprint("didPushRoute");
    return super.didPushRoute(route);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      dprint("app进入前台");
      configAppLifeCycleResumed();
    } else if (state == AppLifecycleState.inactive) {
      dprint("app在前台但不响应事件，比如电话，touch id等");
      configAppLifeCycleInactive();
    } else if (state == AppLifecycleState.paused) {
      dprint("app进入后台");
      configAppLifeCyclePaused();
    } else if (state == AppLifecycleState.detached) {
      dprint("没有宿主视图但是flutter引擎仍然有效");
      configAppLifeCycleDetached();
    }
  }

  ///当前系统改主题改变回调
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    configPlatformBrightness();
  }

  /// 当前系统语言发生改变回调
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    configChangeLocales(locales);
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
