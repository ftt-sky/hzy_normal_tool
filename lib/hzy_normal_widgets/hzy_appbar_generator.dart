/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 22:15:22
 * @LastEditors: TT
 * @LastEditTime: 2023-07-10 09:29:58
 */
import 'package:flutter/material.dart';
import '../hzy_normal_config/hzy_normal_colors.dart';

class HzyAppBarGenerator {
  static PreferredSizeWidget getNoramlAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? titlew,
    Widget? leading,
    IconData? icon,
    bool showback = true,
    double elevation = 0,
    double? toolbarHeight,
    PreferredSizeWidget? bottom,
    Color? textColor,
    Color? leadingIconColor,
    Color? backgroundColor,
    Widget? flexibleSpace,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canshowback = parentRoute?.canPop ?? false;

    backgroundColor ??= HzyNormalColorS.colffffff;
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      toolbarHeight: toolbarHeight,
      actions: actions,
      flexibleSpace: flexibleSpace,
      leading: showback
          ? (canshowback
              ? (leading ??
                  IconButton(
                    icon: Icon(
                      icon ?? Icons.arrow_back_ios,
                      color: leadingIconColor ?? HzyNormalColorS.col101010,
                    ),
                    onPressed:
                        leadingCallback ?? () => Navigator.of(context).pop(),
                  ))
              : null)
          : null,
      title: titlew ??
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: textColor ?? HzyNormalColorS.col101010,
            ),
          ),
      elevation: elevation,
      bottom: bottom,
      automaticallyImplyLeading: showback,
    );
  }

  // 判断是否是一级界面
  static bool isfirstPage({required BuildContext context}) {
    bool showback;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    showback = parentRoute?.canPop ?? false;
    return showback;
  }
}
