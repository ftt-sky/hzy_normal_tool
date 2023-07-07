/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-12 10:25:14
 * @LastEditors: TT
 * @LastEditTime: 2023-07-07 15:56:16
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_base/hzy_normal_base_index.dart';
import '../hzy_normal_abstract/hzy_normal_abstracts.dart';

abstract class HzyBaseLisState<T extends StatefulWidget> extends HzyBaseState<T>
    implements HzyAbstracRefreshWidget, HzyAbstracRefreshMehod {
  @override
  Widget createBody({
    required BuildContext context,
    BoxConstraints? constraints,
  }) {
    return createRefreshWidget();
  }

  /// 创建列表 item
  @override
  Widget createListitem(BuildContext context, int index) {
    return Container();
  }

  /// 创建缺省页界面
  @override
  Widget? createEmptyWidget();
}
