/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-09-23 11:15:57
 * @LastEditors: TT
 * @LastEditTime: 2023-12-16 09:16:45
 */
import 'package:flutter/material.dart';

/// 脚手架
mixin HzyScaffolMixin {
  /// 整体build
  @protected
  Widget createBuild({
    required BuildContext context,
  });

  /// 创建脚手架
  createScaffolWidget({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = configIsNeedScaffol()
        ? Scaffold(
            appBar: createAppBar(context: context),
            backgroundColor: configScallBackgroundColor(),
            resizeToAvoidBottomInset: configResizeToAvoidBottomInset(),
            body: createScallBody(
              context: context,
              constraints: constraints,
            ),
          )
        : createScallBody(
            context: context,
            constraints: constraints,
          );
    return body;
  }

  /// 是否需要脚手架
  bool configIsNeedScaffol() {
    return false;
  }

  /// 键盘弹起 是否形变
  bool? configResizeToAvoidBottomInset() {
    return null;
  }

  /// 配置脚手架背景颜色
  Color? configScallBackgroundColor() {
    return null;
  }

  /// 创建导航栏
  @protected
  PreferredSizeWidget? createAppBar({
    required BuildContext context,
  });

  /// 创建界面body
  @protected
  Widget createScallBody({
    required BuildContext context,
    BoxConstraints? constraints,
  });
}
