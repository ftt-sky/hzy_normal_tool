import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_tools/hzy_normal_tools.dart';
import '../hzy_normal_config/hzy_text_style.dart';

/*
 * @description: 创建通用 item 带> 带下划线 带 点击事件
 * @param {
 * title 左边文字
 * messge 右边文字
 * isshowline 是否显示细线,默认false
 * ontap item 点击事件回调
 * mainAxisAlignment title 和 messge  横轴显示位置
 * isshownext 是否显示 > 默认不显示
 * }
 * @return {*}
 */

Widget createNormalItemWidget({
  String? title,
  String? messge,
  bool? isshowline = false,
  Function(int)? ontap,
  MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.spaceBetween,
  bool? isshownext = false,
  int type = 0,
  double height = 50,
  EdgeInsetsGeometry? padding = const EdgeInsets.only(
    left: 20,
  ),
  bool? istap = false,
  int? index = 0,
  Color? arrowrightColor = HzyNormalColorS.col666666,
  Widget? leftwidget,
  Widget? rightwidget,
  Widget? arrowrightwidget,
  Widget? linewidget,
  BoxDecoration? decoration,
  Color? backgroundColor,
  BorderRadius? borderRadius,
}) {
  return InkWell(
    onTap: () {
      if (ontap != null && istap!) {
        ontap(index!);
      }
    },
    child: Container(
      height: height,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: borderRadius,
          ),
      child: Column(
        children: [
          SizedBox(
            height: height - 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment!,
                    children: [
                      leftwidget ??
                          Text(
                            title ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: type == 0
                                  ? HzyNormalColorS.col222222
                                  : HzyNormalColorS.col666666,
                            ),
                          ),
                      rightwidget ??
                          Text(
                            messge ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: HzyNormalColorS.col222222,
                            ),
                          ),
                    ],
                  ),
                ),
                isshownext!
                    ? arrowrightwidget ??
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: arrowrightColor,
                        )
                    : Container(),
              ],
            ),
          ),
          isshowline!
              ? linewidget ?? HzyNormalTools.configlineSpace()
              : Container()
        ],
      ),
    ),
  );
}

// 向右箭头 带圆角
configArrowForwardIosRounded({
  double? size = 20,
  Color? color,
}) {
  return Icon(
    Icons.arrow_forward_ios_rounded,
    size: size,
    color: color,
  );
}

// 向右箭头 不带圆角
configChevronRight({
  double? size = 20,
  Color? color,
}) {
  return Icon(
    Icons.chevron_right,
    size: size,
    color: color,
  );
}
