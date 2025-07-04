/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-16 22:03:34
 * @LastEditors: TT-hzy 
 * @LastEditTime: 2024-01-23 14:41:47
 */

import 'package:flutter/material.dart';

import '../hzy_normal_config/hzy_normal_config_index.dart';

enum BtnLayoutType {
  // 左图 右字
  letfImg,
  // 上图 下字
  topImg,
  // 右图 左字
  rightImg,
  // 下图 上字
  bottomImg,
  // 纯字
  text,
  // 纯图
  img,
}

class HzyBtnWidget extends StatelessWidget {
  const HzyBtnWidget({
    super.key,
    this.btnLayoutType = BtnLayoutType.text,
    this.decoration,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.margin,
    this.padding,
    this.width,
    this.height = 40,
    this.bgColor,
    this.border,
    this.borderRadius,
    this.radius,
    this.titleWidget,
    this.text,
    this.textStyle,
    this.textAlign,
    this.fontSize = 14,
    this.fontColor = Colors.black,
    this.lineHeight,
    this.imageWidget,
    this.textIsExpend = false,
    this.isCanTap = true,
    this.space = 4,
    this.isFittedBox = false,
    this.tapCall,
  });

  // 按钮布局类型
  final BtnLayoutType? btnLayoutType;

  /// 是否可以点击
  final bool isCanTap;

  /// 按钮宽
  final double? width;

  /// 按钮高
  final double? height;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  // ---------- 装饰器 ----------- //

  /// 背景装饰器
  final Decoration? decoration;

  /// 背景颜色
  final Color? bgColor;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 边框
  final BoxBorder? border;

  /// 圆角边
  final BorderRadiusGeometry? borderRadius;

  /// 圆角
  final double? radius;
  // ---------- 文字视图 --------- //
  /// 自定义文字Widget
  final Widget? titleWidget;

  /// 文本内容
  final String? text;

  /// 文本位置
  final TextAlign? textAlign;

  /// 字体样式
  final TextStyle? textStyle;

  /// 文本是否需要撑满剩余界面
  final bool textIsExpend;

  /// 字体大小
  final double? fontSize;

  /// 字体颜色
  final Color? fontColor;

  /// 字体行高
  final double? lineHeight;
  // ----------- 图片视图 ------------ //
  /// 图片Widget
  final Widget? imageWidget;

  /// 间距
  final double? space;

  /// 是否使用fitbox
  final bool isFittedBox;

  // ---------- 点击回调 -------- //
  final GestureTapCallback? tapCall;
  @override
  Widget build(BuildContext context) {
    Widget tW = createTextWidget();
    Widget iW = createImageWidget();
    Widget sp = createSpaceWidget();
    List<Widget> child = [];
    switch (btnLayoutType) {
      case BtnLayoutType.letfImg:
        child = [
          iW,
          sp,
          configTextExpend(
            tW: tW,
          ),
        ];
        break;
      case BtnLayoutType.topImg:
        child = [
          iW,
          sp,
          tW,
        ];
        break;
      case BtnLayoutType.rightImg:
        child = [
          configTextExpend(
            tW: tW,
          ),
          sp,
          iW,
        ];
        break;
      case BtnLayoutType.bottomImg:
        child = [
          tW,
          sp,
          iW,
        ];
        break;
      case BtnLayoutType.text:
        child = [
          configTextExpend(
            tW: tW,
            isExpend: width == null ? textIsExpend : true,
          ),
        ];
        break;
      case BtnLayoutType.img:
        child = [iW];
        break;
      default:
    }
    Widget body = createLayout(
      list: child,
    );

    body = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: bgColor,
            border: border,
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  radius ?? 0,
                ),
          ),
      child: body,
    );
    body = mainAxisSize == MainAxisSize.min
        ? Row(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              body,
            ],
          )
        : body;

    body = tapCall == null
        ? body
        : InkWell(
            onTap: () {
              if (isCanTap) {
                tapCall?.call();
              }
            },
            child: body,
          );
    body = isFittedBox
        ? FittedBox(
            child: body,
          )
        : body;
    return body;
  }

  configTextExpend({
    required Widget tW,
    bool? isExpend,
  }) {
    return isExpend ?? textIsExpend
        ? Expanded(
            child: tW,
          )
        : tW;
  }

  /// 创建布局
  Widget createLayout({
    required List<Widget> list,
  }) {
    Widget body = Container();

    switch (btnLayoutType) {
      case BtnLayoutType.topImg:
      case BtnLayoutType.bottomImg:
        body = Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: list,
        );
        break;
      case BtnLayoutType.letfImg:
      case BtnLayoutType.rightImg:
        body = Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: list,
        );
        break;
      default:
        body = Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: list,
        );
        break;
    }
    return body;
  }

  /// 创建文本
  Widget createTextWidget() {
    Widget body = titleWidget ??
        Text(
          text ?? '',
          style: textStyle ??
              HzyTextStyle.fontMedium(
                size: fontSize,
                color: fontColor,
                height: lineHeight,
              ),
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ??
              (btnLayoutType == BtnLayoutType.text ? TextAlign.center : null),
          maxLines: 2,
        );

    return body;
  }

  /// 创建间距
  Widget createSpaceWidget() {
    Widget body = Container();
    switch (btnLayoutType) {
      case BtnLayoutType.topImg:
      case BtnLayoutType.bottomImg:
        body = SizedBox(
          height: space,
        );
        break;
      case BtnLayoutType.letfImg:
      case BtnLayoutType.rightImg:
        body = SizedBox(
          width: space,
        );
        break;
      default:
    }
    return body;
  }

  /// 创建图片
  Widget createImageWidget() {
    Widget body = imageWidget ?? Container();
    return body;
  }
}
