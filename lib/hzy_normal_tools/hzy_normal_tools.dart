import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hzy_normal_config/hzy_normal_colors.dart';
import '../hzy_normal_config/page_state.dart';
import '../hzy_normal_widgets/hzy_normal_widgets_index.dart';

/// 通用回调函数类型定义
/// 用于统一项目中的回调函数签名

/// 带索引的点击回调
typedef IndexTapCallback = void Function(int index);

/// 可选索引的点击回调
typedef OptionalIndexTapCallback = void Function(int? index);

/// 简单点击回调
typedef SimpleTapCallback = void Function();

/// 布尔值回调
typedef BooleanCallback = void Function(bool value);

/// 列表项点击回调
typedef ItemTapCallback = void Function(
  HzyNormalItemModel itemModel,
  int? index,
);

/// 兼容旧版本的回调类型（已废弃）
@Deprecated('请使用 IndexTapCallback 替代')
typedef TapIndexCallback = IndexTapCallback;

@Deprecated('请使用 OptionalIndexTapCallback 替代')
typedef TapIndexOptionCallback = OptionalIndexTapCallback;

@Deprecated('请使用 SimpleTapCallback 替代')
typedef TapCallback = SimpleTapCallback;

@Deprecated('请使用 BooleanCallback 替代')
typedef TapBoolCallback = BooleanCallback;

@Deprecated('请使用 ItemTapCallback 替代')
typedef TapItemCallback = ItemTapCallback;

/// 通用工具类
/// 提供常用的工具方法，包括页面状态管理、时间格式化、数据验证等
class HzyNormalTools {
  /// 根据列表数据配置页面状态
  /// 用于分页加载场景，自动判断当前页面应该显示的状态
  ///
  /// [totalCount] 总数据量
  /// [currentPageCount] 当前页获取到的数据量
  /// [pageSize] 每页大小（可选）
  ///
  /// 返回对应的页面状态枚举
  static PageState determinePageState({
    required int totalCount,
    required int currentPageCount,
    int? pageSize,
  }) {
    // 无数据状态
    if (totalCount == 0) {
      return PageState.emptyDataState;
    }
    // 无更多数据状态
    else if (currentPageCount == 0) {
      return PageState.noMoreDataState;
    }
    // 根据页面大小判断是否还有更多数据
    else if (pageSize != null && pageSize > currentPageCount) {
      return PageState.noMoreDataState;
    }
    // 正常数据获取状态
    return PageState.dataFetchState;
  }

  /// 兼容旧版本的页面状态配置方法（已废弃）
  @Deprecated('请使用 determinePageState 替代')
  static configPageState({
    required int allNum,
    required int networkNum,
    int? pageSize,
  }) {
    return determinePageState(
      totalCount: allNum,
      currentPageCount: networkNum,
      pageSize: pageSize,
    );
  }

  /// 格式化日期为 yyyy-MM-dd 格式
  /// 自动补零确保月份和日期为两位数
  ///
  /// [year] 年份
  /// [month] 月份 (1-12)
  /// [day] 日期 (1-31)
  ///
  /// 返回格式化后的日期字符串
  static String formatDateYMD({
    required int year,
    required int month,
    required int day,
  }) {
    final yearStr = year.toString();
    final monthStr = month.toString().padLeft(2, '0');
    final dayStr = day.toString().padLeft(2, '0');
    return '$yearStr-$monthStr-$dayStr';
  }

  /// 兼容旧版本的日期格式化方法（已废弃）
  @Deprecated('请使用 formatDateYMD 替代')
  static String configYMD({
    required int year,
    required int m,
    required int d,
  }) {
    return formatDateYMD(year: year, month: m, day: d);
  }

  /// 格式化消息时间为相对时间或绝对时间
  /// 根据时间间隔自动选择合适的显示格式
  ///
  /// [timestamp] 消息时间戳（毫秒）
  ///
  /// 返回格式化后的时间字符串：
  /// - 1分钟内：刚刚
  /// - 1小时内：X分钟前
  /// - 12小时内：X小时前
  /// - 同年：MM-dd HH:mm
  /// - 不同年：YY-MM-dd HH:mm
  static String formatMessageTime(int timestamp) {
    final now = DateTime.now();
    final currentTime = now.millisecondsSinceEpoch;
    final messageTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // 计算时间差（秒）
    final timeDifference = ((currentTime - timestamp) / 1000).round();

    // 1分钟内
    if (timeDifference <= 60) {
      return '刚刚';
    }
    // 1小时内
    else if (timeDifference <= 3600) {
      final minutes = (timeDifference / 60).floor();
      return '$minutes分钟前';
    }
    // 12小时内
    else if (timeDifference <= 43200) {
      final hours = (timeDifference / 3600).floor();
      return '$hours小时前';
    }
    // 同年显示月日时分
    else if (now.year == messageTime.year) {
      return formatDateTime(
        dateTime: messageTime,
        format: 'MM-dd HH:mm',
      );
    }
    // 不同年显示年月日时分
    else {
      return formatDateTime(
        dateTime: messageTime,
        format: 'YY-MM-dd HH:mm',
      );
    }
  }

  /// 兼容旧版本的消息时间格式化方法（已废弃）
  @Deprecated('请使用 formatMessageTime 替代')
  static String messageTime(int timeStamp) {
    return formatMessageTime(timeStamp);
  }

  /// 格式化日期时间为指定格式
  /// 支持多种格式化模式，自动处理补零
  ///
  /// [dateTime] 要格式化的日期时间
  /// [format] 格式化模式，默认为 "yyyy-MM-dd HH:mm:ss"
  ///
  /// 支持的格式化符号：
  /// - yyyy: 四位年份
  /// - yy: 两位年份
  /// - MM: 两位月份（补零）
  /// - M: 月份
  /// - dd: 两位日期（补零）
  /// - d: 日期
  /// - HH: 两位小时（补零）
  /// - H: 小时
  /// - mm: 两位分钟（补零）
  /// - m: 分钟
  /// - ss: 两位秒数（补零）
  /// - s: 秒数
  /// - SSS: 三位毫秒（补零）
  /// - S: 毫秒
  static String formatDateTime({
    required DateTime dateTime,
    String? format,
  }) {
    String formatStr = format ?? "yyyy-MM-dd HH:mm:ss";

    // 处理年份
    if (formatStr.contains('yy')) {
      final year = dateTime.year.toString();
      if (formatStr.contains('yyyy')) {
        formatStr = formatStr.replaceAll('yyyy', year);
      } else {
        formatStr = formatStr.replaceAll(
          'yy',
          year.substring(year.length - 2),
        );
      }
    }

    // 处理其他时间组件
    formatStr = _formatTimeComponent(dateTime.month, formatStr, 'M', 'MM');
    formatStr = _formatTimeComponent(dateTime.day, formatStr, 'd', 'dd');
    formatStr = _formatTimeComponent(dateTime.hour, formatStr, 'H', 'HH');
    formatStr = _formatTimeComponent(dateTime.minute, formatStr, 'm', 'mm');
    formatStr = _formatTimeComponent(dateTime.second, formatStr, 's', 'ss');
    formatStr =
        _formatTimeComponent(dateTime.millisecond, formatStr, 'S', 'SSS');

    return formatStr;
  }

  /// 兼容旧版本的日期格式化方法（已废弃）
  @Deprecated('请使用 formatDateTime 替代')
  static String commentformatDate({
    required DateTime dateTime,
    String? format,
  }) {
    return formatDateTime(dateTime: dateTime, format: format);
  }

  /// 格式化时间组件的内部辅助方法
  /// 处理单个时间组件的格式化，支持补零
  ///
  /// [value] 时间组件的值
  /// [format] 当前格式化字符串
  /// [singlePattern] 单字符模式（如 'M'）
  /// [fullPattern] 完整模式（如 'MM'）
  ///
  /// 返回处理后的格式化字符串
  static String _formatTimeComponent(
    int value,
    String format,
    String singlePattern,
    String fullPattern,
  ) {
    if (format.contains(singlePattern)) {
      if (format.contains(fullPattern)) {
        // 使用完整模式，需要补零
        final formattedValue = value < 10 ? '0$value' : value.toString();
        format = format.replaceAll(fullPattern, formattedValue);
      } else {
        // 使用单字符模式，不补零
        format = format.replaceAll(singlePattern, value.toString());
      }
    }
    return format;
  }

  /// 兼容旧版本的时间组件格式化方法（已废弃）
  @Deprecated('请使用 _formatTimeComponent 替代')
  static String commentcomFormat(
    int value,
    String format,
    String single,
    String full,
  ) {
    return _formatTimeComponent(value, format, single, full);
  }

  /// 验证中国大陆手机号码格式
  /// 支持主流运营商号段，包括最新的号段
  ///
  /// [phoneNumber] 待验证的手机号码字符串
  ///
  /// 返回验证结果，true表示格式正确
  static bool validateChinesePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;

    // 更新的手机号正则表达式，支持更多号段
    const phoneRegex = r'^1[3-9]\d{9}$';
    return RegExp(phoneRegex).hasMatch(phoneNumber);
  }

  /// 兼容旧版本的手机号验证方法（已废弃）
  @Deprecated('请使用 validateChinesePhoneNumber 替代')
  static bool chinaPhoneNumber(String input) {
    return validateChinesePhoneNumber(input);
  }

  /// 格式化数字为指定小数位数的字符串
  /// 支持四舍五入和直接截断两种模式
  ///
  /// [number] 要格式化的数字
  /// [decimalPlaces] 保留的小数位数
  /// [isTruncate] 是否直接截断（默认false，使用四舍五入）
  ///
  /// 返回格式化后的数字字符串
  static String formatNumber(
    num number, {
    int decimalPlaces = 2,
    bool isTruncate = false,
  }) {
    // 小数位数不能为负数
    if (decimalPlaces < 0) {
      return number.toString();
    }

    final numberStr = number.toString();

    // 处理包含小数点的情况
    if (numberStr.contains('.')) {
      final parts = numberStr.split('.');
      final decimalPart = parts[1];

      // 当前小数位数大于等于目标位数
      if (decimalPart.length >= decimalPlaces) {
        if (isTruncate) {
          // 直接截断
          if (decimalPlaces == 0) {
            return parts[0];
          }
          return '${parts[0]}.${decimalPart.substring(0, decimalPlaces)}';
        } else {
          // 四舍五入
          return number.toStringAsFixed(decimalPlaces);
        }
      } else {
        // 小数位数不够，需要补零
        final zerosToAdd = '0' * (decimalPlaces - decimalPart.length);
        return numberStr + zerosToAdd;
      }
    } else {
      // 整数情况，需要添加小数点和零
      if (decimalPlaces == 0) {
        return numberStr;
      }
      final zeros = '0' * decimalPlaces;
      return '$numberStr.$zeros';
    }
  }

  /// 兼容旧版本的数字格式化方法（已废弃）
  @Deprecated('请使用 formatNumber 替代')
  static String formatNum(
    double num, {
    int postion = 2,
  }) {
    return formatNumber(num, decimalPlaces: postion);
  }

  /// 兼容旧版本的数字格式化方法（已废弃）
  @Deprecated('请使用 formatNumber 替代')
  static String formartNum(
    num target,
    int postion, {
    bool isCrop = false,
  }) {
    return formatNumber(
      target,
      decimalPlaces: postion,
      isTruncate: isCrop,
    );
  }

  /// 创建通用分割线组件
  /// 用于在列表项之间或其他需要分割的地方添加视觉分隔
  ///
  /// [height] 分割线高度，默认0.5
  /// [color] 分割线颜色，默认为浅灰色
  /// [padding] 内边距
  /// [margin] 外边距
  /// [decoration] 自定义装饰，会覆盖默认的颜色设置
  ///
  /// 返回配置好的分割线Widget
  static Widget buildDividerLine({
    double height = 0.5,
    Color color = HzyNormalColorS.cole3e3e3,
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

  /// 兼容旧版本的分割线方法（已废弃）
  @Deprecated('请使用 buildDividerLine 替代')
  static Widget configLineSpace({
    double height = 0.5,
    Color color = HzyNormalColorS.cole3e3e3,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    return buildDividerLine(
      height: height,
      color: color,
      padding: padding,
      margin: margin,
      decoration: decoration,
    );
  }

  /// 隐藏软键盘
  /// 用于在用户完成输入或需要隐藏键盘时调用
  ///
  /// [context] 当前页面的BuildContext
  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// 请求显示软键盘
  /// 用于程序化地显示键盘，通常在自动聚焦输入框时使用
  ///
  /// [context] 当前页面的BuildContext
  static void showKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.requestFocus();
    }
  }

  /// 兼容旧版本的键盘隐藏方法（已废弃）
  @Deprecated('请使用 hideKeyboard 替代')
  static keydissMiss(BuildContext context) {
    hideKeyboard(context);
  }

  /// 兼容旧版本的键盘显示方法（已废弃）
  @Deprecated('请使用 showKeyboard 替代')
  static requestFocus(BuildContext context) {
    showKeyboard(context);
  }

  /// 将文本复制到系统剪贴板
  /// 用于实现复制功能，如复制链接、文本等
  ///
  /// [text] 要复制的文本内容
  ///
  /// 返回Future，表示复制操作的完成状态
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// 从系统剪贴板获取文本内容
  /// 用于实现粘贴功能
  ///
  /// 返回Future<ClipboardData?>，包含剪贴板中的文本数据
  static Future<ClipboardData?> getClipboardData() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }

  /// 从系统剪贴板获取纯文本内容
  /// 便捷方法，直接返回文本字符串
  ///
  /// 返回Future<String?>，剪贴板中的文本内容，如果为空则返回null
  static Future<String?> getClipboardText() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  /// 兼容旧版本的剪贴板设置方法（已废弃）
  @Deprecated('请使用 copyToClipboard 替代')
  static setDataToClipboard({required String text}) async {
    await copyToClipboard(text);
  }

  /// 兼容旧版本的剪贴板获取方法（已废弃）
  @Deprecated('请使用 getClipboardData 或 getClipboardText 替代')
  static getDataToClipboard() {
    return getClipboardData();
  }
}

/// 调试模式下的日志输出
/// 根据平台自动选择合适的日志输出方式
///
/// [object] 要打印的对象
void debugLog(Object? object) {
  if (kIsWeb) {
    if (kDebugMode) {
      print(object.toString());
    }
  } else {
    if (kDebugMode) {
      print(object.toString());
    }
  }
}

/// 长文本分段打印
/// 用于打印超长日志信息，避免单次打印内容过多导致截断
///
/// [message] 要打印的长文本消息
/// [maxLength] 每段的最大长度，默认1000字符
void printLongText(String message, {int maxLength = 1000}) {
  if (!kDebugMode) return;

  // 防止中文字符过多导致显示问题，限制每段长度
  String remainingText = message;

  while (remainingText.length > maxLength) {
    // 打印当前段
    print(remainingText.substring(0, maxLength));
    // 更新剩余文本
    remainingText = remainingText.substring(maxLength);
  }

  // 打印剩余部分
  if (remainingText.isNotEmpty) {
    print(remainingText);
  }
}

/// 兼容旧版本的调试打印函数（已废弃）
@Deprecated('请使用 debugLog 替代')
dPrint(Object? object) {
  debugLog(object);
}

/// 兼容旧版本的长文本打印函数（已废弃）
@Deprecated('请使用 printLongText 替代')
p(String msg) {
  printLongText(msg);
}

/// 将16进制颜色字符串转换为Color对象
/// 支持多种格式的16进制颜色值
///
/// [hexColor] 16进制颜色字符串，支持格式：
///   - "#RRGGBB" (如 "#FF0000")
///   - "RRGGBB" (如 "FF0000")
///   - "#AARRGGBB" (如 "#80FF0000")
///   - "AARRGGBB" (如 "80FF0000")
///
/// 返回对应的Color对象，如果输入无效则返回透明色
Color parseHexColor(String? hexColor) {
  if (hexColor == null || hexColor.isEmpty) {
    return Colors.transparent;
  }

  // 移除#号并转为大写
  String cleanHex = hexColor.toUpperCase().replaceAll("#", "");

  // 如果是6位，添加FF作为alpha值（完全不透明）
  if (cleanHex.length == 6) {
    cleanHex = "FF$cleanHex";
  }

  // 验证长度是否正确
  if (cleanHex.length != 8) {
    return Colors.transparent;
  }

  try {
    return Color(int.parse(cleanHex, radix: 16));
  } catch (e) {
    // 解析失败时返回透明色
    return Colors.transparent;
  }
}

/// 兼容旧版本的颜色解析函数（已废弃）
@Deprecated('请使用 parseHexColor 替代')
Color getColorFromHex(String? hexColor) {
  return parseHexColor(hexColor);
}

/// 显示模态底部弹窗
/// 用于展示底部操作面板、选择器等内容
///
/// [context] 当前页面的BuildContext
/// [child] 要显示的子组件
/// [backgroundColor] 背景颜色
/// [elevation] 阴影高度
/// [shape] 形状边框
/// [clipBehavior] 裁剪行为
/// [constraints] 约束条件
/// [enableDrag] 是否允许拖拽
/// [isDismissible] 是否可通过点击外部区域关闭
/// [isScrollControlled] 是否支持滚动控制
///
/// 返回Future，当弹窗关闭时完成
Future<T?> showBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  bool? enableDrag,
  bool isDismissible = true,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag ?? true,
    builder: (BuildContext context) {
      return child;
    },
  );
}

/// 兼容旧版本的底部弹窗显示函数（已废弃）
@Deprecated('请使用 showBottomSheet 替代')
configShowBottomSheet({
  required BuildContext context,
  required Widget child,
  BoxConstraints? constraints,
  Color? backgroundColor = Colors.transparent,
  ShapeBorder? shape = const ContinuousRectangleBorder(),
  bool isScrollControlled = false,
}) async {
  return await showBottomSheet(
    context: context,
    child: child,
    constraints: constraints,
    backgroundColor: backgroundColor,
    shape: shape,
    isScrollControlled: isScrollControlled,
  );
}

/// 显示通用对话框
/// 用于展示各种类型的对话框内容
///
/// [context] 当前页面的BuildContext
/// [child] 要显示的对话框内容组件
/// [barrierDismissible] 是否可通过点击外部区域关闭对话框
/// [barrierColor] 遮罩层颜色
/// [barrierLabel] 遮罩层语义标签
/// [useSafeArea] 是否使用安全区域
/// [useRootNavigator] 是否使用根导航器
/// [routeSettings] 路由设置
/// [anchorPoint] 锚点位置
///
/// 返回Future，当对话框关闭时完成并返回结果
Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    builder: (BuildContext context) {
      return child;
    },
  );
}

/// 兼容旧版本的对话框显示函数（已废弃）
@Deprecated('请使用 showCustomDialog 替代')
configShowDialog({
  required BuildContext context,
  required Widget widget,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
}) async {
  return await showCustomDialog(
    context: context,
    child: widget,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
  );
}

/// 获取当前Dart运行时版本信息
/// 返回包含Dart版本、平台信息等的完整字符串
///
/// 返回格式示例："Dart 3.0.0 (stable) on macos_arm64"
String getDartVersion() {
  return Platform.version;
}

/// 兼容旧版本的Dart版本获取函数（已废弃）
@Deprecated('请使用 getDartVersion 替代')
configDartVersion() {
  return getDartVersion();
}
