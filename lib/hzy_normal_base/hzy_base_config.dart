/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-20 11:00:41
 * @LastEditors: TT
 * @LastEditTime: 2023-03-20 11:51:24
 */

import '../hzy_normal_abstract/hzy_normal_abstracts.dart';
import '/hzy_normal_config/page_state.dart';

class HzyBaseConfig {
  bool isShowLoading = false;
  bool isNeedLayout = false;
  bool isOnWillPop = true;
  PageState pageState = PageState.initializedState;
}

class HzyBaseVM with HzyAbstractNetWorkTs, HzyAbstracRefreshMehod {
  final Function() reload;

  HzyBaseConfig config = HzyBaseConfig();

  HzyBaseVM({
    required this.reload,
  });
  @override
  Map<String, dynamic>? configNetWorkParmas({String? mark}) {
    return null;
  }

  @override
  configNetWork({required String mark, int? type}) {}

  @override
  void configLoading() {}

  @override
  void configRefresh() {}

  @override
  void configRefreshController() {}

  @override
  PageState endRefresh({required int type, required PageState pageState}) {
    throw UnimplementedError();
  }
}
