/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-20 11:00:41
 * @LastEditors: TT
 * @LastEditTime: 2023-03-21 21:09:59
 */

import '../hzy_normal_abstract/hzy_normal_abstracts.dart';
import '/hzy_normal_config/page_state.dart';

class HzyBaseConfig {
  bool isShowLoading = false;

  PageState pageState = PageState.initializedState;
}

class HzyBaseVM with HzyAbstractNetWorkTs, HzyAbstracRefreshMehod {
  Function()? reload;

  HzyBaseConfig config = HzyBaseConfig();

  String? listMark;
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

  tapCommonPlaceHolderBtn() {
    config.pageState = PageState.initializedState;
    configNetWork(mark: listMark ?? "", type: 3);
  }

  configReload() {
    if (reload != null) {
      reload!();
    }
  }

  @override
  PageState endRefresh({required int type, required PageState pageState}) {
    throw UnimplementedError();
  }
}
