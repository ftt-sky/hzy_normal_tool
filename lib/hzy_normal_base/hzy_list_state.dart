/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-25 10:23:27
 * @LastEditors: TT
 * @LastEditTime: 2023-06-25 10:29:53
 */
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_base/hzy_life_cycle_state.dart';

import '../hzy_normal_abstract/hzy_normal_abstracts.dart';

abstract class HzyLisState<T extends StatefulWidget>
    extends HzyLifeCycleState<T>
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
