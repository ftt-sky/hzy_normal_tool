/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-12-16 09:22:48
 * @LastEditors: TT
 * @LastEditTime: 2023-12-16 09:22:49
 */

import 'package:flutter/material.dart';

import '../hzy_normal_config/page_state.dart';

class HzyPlaceHolderConfig {
  static Widget? loadWidget;
}

class HzyPlaceHolderWidget extends StatelessWidget {
  // 网络请求状态
  final PageState pageState;
  // 子视图
  final Widget? child;

  /// 加载动画
  final Widget? loadingWidget;
  // 站位图
  final Widget? errorWidget;
  // 是否显示加载动画
  final bool? isshowloading;
  const HzyPlaceHolderWidget({
    super.key,
    required this.pageState,
    this.child,
    this.errorWidget,
    this.loadingWidget,
    this.isshowloading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (pageState == PageState.errorState ||
        pageState == PageState.errorshowRelesh ||
        pageState == PageState.emptyDataState) {
      return errorWidget ?? Container();
    } else if (isshowloading! && pageState == PageState.initializedState) {
      return Center(
        child:
            loadingWidget ?? (HzyPlaceHolderConfig.loadWidget ?? Container()),
      );
    }
    return child ?? Container();
  }
}
