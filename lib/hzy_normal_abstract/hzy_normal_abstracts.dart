import 'package:flutter/material.dart';
import '../hzy_normal_config/page_state.dart';

/// 刷新界面 规范
abstract class HzyAbstracRefreshWidget {
  /// 创建刷新控件
  Widget createRefreshWidget();

  /// 创建列表
  Widget createListView();

  /// 创建列表 item
  Widget createListitem(BuildContext context, int index);
}

/// 刷新界面 触发方法
abstract class HzyAbstracRefreshMehod {
  int page = 1;

  void configRefreshController();

  /// 结束刷新
  PageState endRefresh({
    required int type,
    required PageState pageState,
  });

  /// 下啦刷新 触发事件
  void configRefresh();

  /// 上啦加载 触发事件
  void configLoading();
}

/// 界面通用属性
abstract class HzyAbstractAttribute {
  /// 导航栏标题
  final String? title = null;

  /// 导航栏颜色
  final Color? navbackcolor = null;

  /// 默认安全区顶部 忽略
  final bool safeAreatop = true;

  /// 默认安全区底部 忽略
  final bool safeAreabottm = true;

  /// 网络加载状态
  final PageState pageState = PageState.initializedState;

  /// 背景颜色
  final Color? backgroundColor = null;

  /// 是否显示Scaffol脚手架
  final bool isneedScaffol = true;

  /// 滚动属性
  final bool? resizeToAvoidBottomInset = null;

  /// 添加右滑返回拦截器
  final bool isAddPopScope = false;
}

abstract class HzyAbstractNetWorkTs {
  Map<String, dynamic>? configNetWorkParmas({
    String? mark,
  });

  configNetWork({
    required String mark,
    int? type,
  });
}

// 配置网络请求规范
abstract class HzyAbstractNetWork {
  // String pathStr = "path";
  // String paramsStr = "params";

  // Function(String path, dynamic data)? onSuccess;

  // Function(String path, dynamic data)? onFail;

  /// 配置网络请求参数
  /// mark 区分不同请求
  @protected
  Map<String, dynamic>? configNetWorkParmas({
    String? mark,
    Map<String, dynamic>? params,
  });

  /// 统一装饰网络请求参数格式
  /// {
  ///   path: path,
  ///   params: params
  /// }
  // @protected
  // configNormalParmas({
  //   String? path,
  //   Map<String, dynamic>? params,
  // });

  /// 网络请求
  @protected
  getnetworkdata({
    int? type,
    Map<String, dynamic>? info,
  });

  /// 解析数据之网络成功
  // configParsingdataWithNetWorkSuccess({
  //   required String path,
  //   dynamic rep,
  //   dynamic data,
  // });

  // /// 成功数据解析完成后回调
  // configSuccessDataCallBack({
  //   required String path,
  //   dynamic data,
  // });

  // /// 解析数据之网络失败
  // configFailDataCallBack({
  //   required String path,
  //   dynamic data,
  // });

  // /// 失败数据解析完成后回调
  // configParsingdataWithNetWorkFail({
  //   required String path,
  //   dynamic rep,
  //   String? msg,
  // });
}
