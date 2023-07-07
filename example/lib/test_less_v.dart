/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-07 14:40:49
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 15:57:38
 */

import 'package:example/test_state_v.dart';
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class TestLessV extends HzyBaseLess {
  TestLessV({super.key});
  @override
  String? get title => "偷偷";

  @override
  Widget createBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Container();
    body = InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const TestPage();
            },
          ),
        );
      },
      child: body,
    );
    return body;
  }
}
