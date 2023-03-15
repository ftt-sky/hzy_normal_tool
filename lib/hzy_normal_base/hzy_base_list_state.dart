/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-12 10:25:14
 * @LastEditors: TT
 * @LastEditTime: 2023-03-15 22:43:26
 */

import 'package:flutter/material.dart';
import '../hzy_normal_abstract/hzy_normal_abstracts.dart';
import 'hzy_base_state.dart';

abstract class HzyBaseLisState<T extends StatefulWidget> extends HzyBaseState<T>
    with HzyAbstracRefreshWidget {
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
