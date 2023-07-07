/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-07 14:40:49
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 16:34:17
 */

import 'package:example/test_state_v.dart';
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class TestLessV extends HzyLess {
  TestLessV({super.key});
  @override
  String? get appBarTitle => "less";
  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = Container();
    body = InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const TestPage();
          },
        ));
      },
      child: body,
    );
    return body;
  }

  @override
  Color? get scallBackGroundColor => Colors.white.withOpacity(0);
  @override
  Color? get navBackgroudColor => Colors.white.withOpacity(0);

  @override
  Color? createAppBarTextColor() {
    return Colors.white;
  }

  @override
  Color? createLeadingIconColor() {
    return Colors.white;
  }

  @override
  configBoxDecoreation() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.red,
          Colors.orange,
        ],
      ),
    );
  }
}
 