/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-07 15:48:20
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 16:20:27
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

class TestState extends HzyState<TestPage> {
  @override
  String? get appBarTitle => "State";
  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    Widget body = Container();
    return body;
  }
}
