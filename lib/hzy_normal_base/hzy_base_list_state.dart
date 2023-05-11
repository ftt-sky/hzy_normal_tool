/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-12 10:25:14
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 15:20:52
 */

import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_base/hzy_normal_base_index.dart';
import '../hzy_normal_abstract/hzy_normal_abstracts.dart';

abstract class HzyBaseLisState<T extends StatefulWidget> extends HzyBaseState<T>
    with HzyAbstracRefreshWidget, HzyAbstracRefreshMehod {
  @override
  Widget createBody({BoxConstraints? constraints}) {
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
