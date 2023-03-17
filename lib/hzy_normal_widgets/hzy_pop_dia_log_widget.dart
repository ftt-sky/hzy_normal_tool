/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-17 20:44:46
 * @LastEditors: TT
 * @LastEditTime: 2023-03-17 22:46:56
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_text_style.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widgets_index.dart';

class HzyPopDiaLogWidget extends StatelessWidget {
  const HzyPopDiaLogWidget({
    super.key,
    this.titleWidget,
    this.title,
    this.titleColor = HzyNormalColorS.col222222,
    this.titleFontSize = 16,
    this.msgWidget,
    this.msgColor = HzyNormalColorS.col333333,
    this.msgFontSize = 14,
    this.msg,
    this.btnSWidget,
  });

  /// 标题视图
  final Widget? titleWidget;

  /// 标题内容
  final String? title;

  final Color? titleColor;

  final double? titleFontSize;

  /// 提示语视图
  final Widget? msgWidget;

  final Color? msgColor;

  final double? msgFontSize;

  /// 提示内容
  final String? msg;

  /// 底部按钮视图
  final Widget? btnSWidget;
  @override
  Widget build(BuildContext context) {
    Widget body = Container();

    return body;
  }

  createShowDialog() {
    Widget body = createPopDialogWidget();
  }

  createPopDialogWidget() {
    Widget body = Container();
    return body;
  }

  /// 创建标题
  createTitleWidget() {
    Widget body = Text(
      title ?? "",
      style: HzyTextStyle.fontBold(
        size: titleFontSize,
        color: titleColor,
      ),
      textAlign: TextAlign.center,
    );

    body = titleWidget ?? body;
    return body;
  }

  /// 创建内容
  createMsgWidget() {
    Widget body = Text(
      msg ?? "",
      style: HzyTextStyle.fontMedium(
        size: msgFontSize,
        color: msgColor,
      ),
      textAlign: TextAlign.center,
    );
    body = msgWidget ?? body;

    return body;
  }

  /// 创建底部按钮
  createBtnWidget() {
    Widget body = HzySureAndCannerBtnWidget();

    body = btnSWidget ?? body;
    return body;
  }
}
