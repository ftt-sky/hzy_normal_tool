/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 16:51:23
 * @LastEditors: TT-hzy 
 * @LastEditTime: 2024-05-27 09:01:31
 */

import 'package:flutter/material.dart';

/// 导航到指定命名路由的根页面
/// 支持两种方式：弹出到指定页面或推送并清除所有页面
///
/// [context] 当前页面的BuildContext
/// [isPop] 是否使用弹出方式（true）还是推送方式（false）
/// [routeName] 目标路由名称，默认为根路由"/"
///
/// 返回Future，表示导航操作的完成状态
navigateToNamedRoute<T>({
  required BuildContext context,
  bool isPop = true,
  String routeName = "/",
}) {
  if (isPop) {
    // 弹出到指定命名路由
    Navigator.popUntil(
      context,
      ModalRoute.withName(routeName),
    );
  } else {
    // 推送到指定命名路由并清除所有历史页面
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );
  }
}

/// 兼容旧版本的命名路由导航函数（已废弃）
@Deprecated('请使用 navigateToNamedRoute 替代')
jumpToRootWithNamePage({
  required BuildContext context,
  bool isPop = true,
  String name = "/",
}) {
  return navigateToNamedRoute(
    context: context,
    isPop: isPop,
    routeName: name,
  );
}

/// 导航到根页面（支持Widget和命名路由）
/// 提供更灵活的导航方式，支持直接传入Widget或使用命名路由
///
/// [context] 当前页面的BuildContext
/// [isPop] 是否使用弹出方式（true）还是推送方式（false）
/// [routeName] 目标路由名称，默认为根路由"/"
/// [widget] 要导航到的Widget页面（优先级高于routeName）
/// [arguments] 传递给目标页面的参数
///
/// 返回Future，表示导航操作的完成状态
navigateToRootPage<T>({
  required BuildContext context,
  bool isPop = true,
  String routeName = "/",
  Widget? widget,
  Object? arguments,
}) {
  if (isPop) {
    // 弹出到指定路由
    Navigator.popUntil(
      context,
      ModalRoute.withName(routeName),
    );
  } else {
    if (widget != null) {
      // 使用Widget直接导航并清除所有历史页面
      return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<T>(
          builder: (context) => widget,
        ),
        (route) => false,
      );
    } else {
      // 使用命名路由导航并清除所有历史页面
      return Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (route) => false,
        arguments: arguments,
      );
    }
  }
}

/// 兼容旧版本的根页面导航函数（已废弃）
@Deprecated('请使用 navigateToRootPage 替代')
jumpToRootPage({
  required BuildContext context,
  bool isPop = true,
  String name = "/",
  Widget? widget,
  Object? arguments,
}) {
  return navigateToRootPage(
    context: context,
    isPop: isPop,
    routeName: name,
    widget: widget,
    arguments: arguments,
  );
}

/// 获取当前页面的路由传递参数
/// 用于在目标页面中获取从上一个页面传递过来的数据
///
/// [context] 当前页面的BuildContext
///
/// 返回传递的参数对象，如果没有参数则返回null
Object? getRouteArguments(BuildContext context) {
  return ModalRoute.of(context)?.settings.arguments;
}

/// 获取指定类型的路由传递参数
/// 提供类型安全的参数获取方式
///
/// [context] 当前页面的BuildContext
///
/// 返回指定类型的参数，如果类型不匹配或参数为null则返回null
T? getTypedRouteArguments<T>(BuildContext context) {
  final arguments = ModalRoute.of(context)?.settings.arguments;
  return arguments is T ? arguments : null;
}

/// 兼容旧版本的路由参数获取函数（已废弃）
@Deprecated('请使用 getRouteArguments 替代')
configPageArguments({
  required BuildContext context,
}) {
  return getRouteArguments(context);
}
