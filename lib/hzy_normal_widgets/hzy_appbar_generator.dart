import 'package:flutter/material.dart';
import '../hzy_normal_config/hzy_normal_colors.dart';

class HzyAppBarGenerator {
  static PreferredSize getNoramlAppBar({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? titlew,
    Widget? leading,
    bool showback = true,
    double elevation = 0,
    double prferredheight = -1,
    PreferredSizeWidget? bottom,
    Color? textColor,
    Color? leadingIconColor,
    Color? backgroundColor,
    Function()? leadingCallback,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool canshowback = parentRoute?.canPop ?? false;
    if (prferredheight == -1) {
      prferredheight = 54;
    }

    backgroundColor ??= HzyNormalColorS.colffffff;
    return PreferredSize(
      preferredSize: Size.fromHeight(prferredheight),
      child: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        actions: actions,
        leading: showback
            ? (canshowback
                ? (leading ??
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
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
      ),
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
