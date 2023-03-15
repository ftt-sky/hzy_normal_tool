

import 'package:flutter/cupertino.dart';

import '../hzy_normal_abstract/hzy_normal_abstract_index.dart';

abstract class HzyBaseState<T extends StatefulWidget> extends State<T>
    with HzyAbstractWidget, HzyAbstractAttribute {
  /// 界面初始化完成
  @override
  void initState() {
    initDefaultState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = createScaffol(
      context: context,
      safeAreatop: safeAreatop,
      safeAreabottm: safeAreabottm,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      title: title,
      backgroundColor: backgroundColor,
      navbackcolor: navbackcolor,
      isneedScaffol: isneedScaffol,
      isAddPopScope: isAddPopScope,
    );
    return widget;
  }

  @override
  void dispose() {
    initDefaultDispose();
    super.dispose();
  }

  /// 界面进入
  void initDefaultState() {}

  /// 界面销毁
  void initDefaultDispose() {}
}
