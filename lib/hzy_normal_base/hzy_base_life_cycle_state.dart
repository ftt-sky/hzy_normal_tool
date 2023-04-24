/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-22 10:11:48
 * @LastEditors: TT
 * @LastEditTime: 2023-04-24 11:25:23
 */
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

abstract class HzyBaseLifeCycleState<T extends StatefulWidget>
    extends HzyBaseState<T> with WidgetsBindingObserver, HzyNormalLifeCycleAbs {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      configWidgetRenderingCompleted();
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() {
    dprint("idPopRoute");
    return super.didPopRoute();
  }

  Future<bool> configWidgetRenderingCompleted() async {
    return true;
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
