import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hzy_normal_config/hzy_normal_colors.dart';
import '../hzy_normal_config/page_state.dart';

class HzyNormalTools {
  // 根据列表数据 配置界面状态
  static configPageState({
    required int allNum,
    required int networkNum,
  }) {
    PageState st = PageState.dataFetchState;
    if (allNum == 0) {
      st = PageState.emptyDataState;
    } else if (networkNum == 0) {
      st = PageState.noMoreDataState;
    }
    return st;
  }

  // 配置 yyyy-mm-dd
  static String configyyyymmdd({
    required int year,
    required int m,
    required int d,
  }) {
    String ystr = "$year";
    String mstr = "$m";
    String dStr = '$d';
    if (m < 10) {
      mstr = "0$m";
    }
    if (d < 10) {
      dStr = "0$d";
    }
    return "$ystr-$mstr-$dStr";
  }

  // 配置几分钟前
  static String messageTime(int timeStamp) {
    int time = DateTime.now().millisecondsSinceEpoch;
    String msg = '';
    int distance = ((time - timeStamp) / 1000).round();
    if (distance <= 60) {
      msg = '刚刚';
    } else if (distance <= 3600) {
      msg = '${(distance / 60).floor()}分钟前';
    } else if (distance <= 43200) {
      msg = '${(distance / 60 / 60).floor()}小时前';
    } else if (DateTime.fromMillisecondsSinceEpoch(time).year ==
        DateTime.fromMillisecondsSinceEpoch(timeStamp).year) {
      msg = commentformatDate(
        dateTime: DateTime.fromMillisecondsSinceEpoch(timeStamp),
        format: 'MM-dd HH:mm',
      );
    } else {
      msg = commentformatDate(
        dateTime: DateTime.fromMillisecondsSinceEpoch(timeStamp),
        format: 'YY-MM-dd HH:mm',
      );
    }

    return msg;
  }

  static String commentformatDate({
    required DateTime dateTime,
    String? format,
  }) {
    format = format ?? "yyyy-MM-dd HH:mm:ss";
    if (format.contains('yy')) {
      String year = dateTime.year.toString();
      if (format.contains('yyyy')) {
        format = format.replaceAll('yyyy', year);
      } else {
        format = format.replaceAll(
            'yy', year.substring(year.length - 2, year.length));
      }
    }

    format = commentcomFormat(dateTime.month, format, 'M', 'MM');
    format = commentcomFormat(dateTime.day, format, 'd', 'dd');
    format = commentcomFormat(dateTime.hour, format, 'H', 'HH');
    format = commentcomFormat(dateTime.minute, format, 'm', 'mm');
    format = commentcomFormat(dateTime.second, format, 's', 'ss');
    format = commentcomFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String commentcomFormat(
    int value,
    String format,
    String single,
    String full,
  ) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// 获取图片地址
  static String getImagePath(
    String name, {
    String format = 'png',
  }) {
    return 'assets/images/$name.$format';
  }

  // 校验手机号
  static bool chinaPhoneNumber(String input) {
    if (input.isEmpty) return false;
    //手机正则验证
    String regexPhoneNumber =
        "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regexPhoneNumber).hasMatch(input);
  }

  String formatNum(
    double num, {
    int postion = 2,
  }) {
    String money = formartNum(num, 2);
    return money;
  }

  String formartNum(
    num target,
    int postion, {
    bool isCrop = false,
  }) {
    String t = target.toString();
    // 如果要保留的长度小于等于0 直接返回当前字符串
    if (postion < 0) {
      return t;
    }
    if (t.contains(".")) {
      String t1 = t.split(".").last;
      if (t1.length >= postion) {
        if (isCrop) {
          // 直接裁剪
          return t.substring(0, t.length - (t1.length - postion));
        } else {
          // 四舍五入
          return target.toStringAsFixed(postion);
        }
      } else {
        // 不够位数的补相应个数的0
        String t2 = "";
        for (int i = 0; i < postion - t1.length; i++) {
          t2 += "0";
        }
        return t + t2;
      }
    } else {
      // 不含小数的部分补点和相应的0
      String t3 = postion > 0 ? "." : "";

      for (int i = 0; i < postion; i++) {
        t3 += "0";
      }
      return t + t3;
    }
  }

  // 通用间隔
  static Widget configlineSpace({
    double height = 0.5,
    Color color = HzyNormalColorS.cole5e5e5,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    return Container(
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: color,
          ),
      padding: padding,
      margin: margin,
    );
  }

  // 设置键盘 隐藏
  static keydissmiss(
    BuildContext context,
  ) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  // 赋值剪切板内容
  static setDataToClipboard({
    String? text,
    Function? copyBlock,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (copyBlock != null) {
      copyBlock();
    }
  }

  // 获取剪切板内容
  static getDataToClipboard() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }
}
