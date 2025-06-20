import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_normal_tool/hzy_normal_config/hzy_normal_colors.dart';
import 'package:hzy_normal_tool/hzy_normal_tools/hzy_normal_tools.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widgets_index.dart';
import '../hzy_normal_config/hzy_text_style.dart';

/// 通用列表项配置类
/// 用于减少函数参数过多的问题，提高代码可维护性
class NormalItemConfig {
  /// 左侧标题文本
  final String? title;

  /// 右侧消息文本
  final String? message;

  /// 是否显示分割线
  final bool showLine;

  /// 主轴对齐方式
  final MainAxisAlignment mainAxisAlignment;

  /// 是否显示右侧箭头
  final bool showNext;

  /// 项目类型（影响文字颜色）
  final int type;

  /// 容器高度
  final double height;

  /// 内边距
  final EdgeInsetsGeometry padding;

  /// 是否可点击
  final bool isTappable;

  /// 项目索引
  final int index;

  /// 右侧箭头颜色
  final Color arrowColor;

  /// 自定义左侧组件
  final Widget? leftWidget;

  /// 自定义右侧组件
  final Widget? rightWidget;

  /// 自定义箭头组件
  final Widget? arrowWidget;

  /// 自定义分割线组件
  final Widget? lineWidget;

  /// 容器装饰
  final BoxDecoration? decoration;

  /// 背景颜色
  final Color? backgroundColor;

  /// 圆角半径
  final BorderRadius? borderRadius;

  /// 点击回调函数
  final Function(int)? onTap;

  const NormalItemConfig({
    this.title,
    this.message,
    this.showLine = false,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.showNext = false,
    this.type = 0,
    this.height = 50,
    this.padding = const EdgeInsets.only(left: 20),
    this.isTappable = false,
    this.index = 0,
    this.arrowColor = HzyNormalColorS.col666666,
    this.leftWidget,
    this.rightWidget,
    this.arrowWidget,
    this.lineWidget,
    this.decoration,
    this.backgroundColor,
    this.borderRadius,
    this.onTap,
  });
}

/// 弹窗配置类
/// 统一管理弹窗的各种配置参数
class DialogConfig {
  /// 弹窗背景颜色
  final Color? dialogBackColor;

  /// 点击外部是否可关闭
  final bool barrierDismissible;

  /// 自定义弹窗内容
  final Widget? body;

  /// 自定义标题组件
  final Widget? titleWidget;

  /// 标题文本
  final String? title;

  /// 标题颜色
  final Color? titleColor;

  /// 标题字体大小
  final double? titleFontSize;

  /// 自定义消息组件
  final Widget? msgWidget;

  /// 消息颜色
  final Color? msgColor;

  /// 消息字体大小
  final double? msgFontSize;

  /// 消息文本
  final String? msg;

  /// 自定义按钮组件
  final Widget? btnWidget;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 消息与按钮间距
  final double? msgAndBtnSpace;

  /// 标题与消息间距
  final double? titleAndMsgSpace;

  /// 圆角半径
  final double? radius;

  /// 确认按钮文本
  final String? sureMsg;

  /// 确认按钮背景色
  final Color? sureBgColor;

  /// 确认按钮文字颜色
  final Color? sureTitleColor;

  /// 取消按钮文本
  final String? cancelMsg;

  /// 取消按钮背景色
  final Color? cancelBgColor;

  /// 取消按钮文字颜色
  final Color? cancelTitleColor;

  /// 确认按钮点击回调
  final VoidCallback? tapSure;

  /// 取消按钮点击回调
  final VoidCallback? tapCancel;

  /// 按钮间距
  final double? space;

  /// 布局类型：1-左右布局，2-上下布局
  final int? layoutType;

  /// 按钮类型：1-单按钮，2-双按钮
  final int? btnType;

  /// 新增字段用于简单对话框
  /// 内容文本
  final String? content;

  /// 确认按钮文本
  final String? confirmText;

  /// 取消按钮文本
  final String? cancelText;

  /// 确认按钮回调
  final VoidCallback? onConfirm;

  /// 取消按钮回调
  final VoidCallback? onCancel;

  /// 标题样式
  final TextStyle? titleStyle;

  /// 内容样式
  final TextStyle? contentStyle;

  /// 背景颜色
  final Color? backgroundColor;

  /// 对话框形状
  final ShapeBorder? shape;

  /// 确认按钮样式
  final ButtonStyle? confirmButtonStyle;

  /// 取消按钮样式
  final ButtonStyle? cancelButtonStyle;

  const DialogConfig({
    this.dialogBackColor,
    this.barrierDismissible = true,
    this.body,
    this.titleWidget,
    this.title,
    this.titleColor,
    this.titleFontSize,
    this.msgWidget,
    this.msgColor,
    this.msgFontSize,
    this.msg,
    this.btnWidget,
    this.padding,
    this.msgAndBtnSpace,
    this.titleAndMsgSpace,
    this.radius = 20,
    this.sureMsg,
    this.sureBgColor,
    this.sureTitleColor,
    this.cancelMsg,
    this.cancelBgColor,
    this.cancelTitleColor,
    this.tapSure,
    this.tapCancel,
    this.space,
    this.layoutType,
    this.btnType,
    this.content,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.titleStyle,
    this.contentStyle,
    this.backgroundColor,
    this.shape,
    this.confirmButtonStyle,
    this.cancelButtonStyle,
  });
}

/// 文本输入框配置类
/// 统一管理文本输入框的各种配置参数
class TextFieldConfig {
  /// 文本对齐方式
  final TextAlign textAlign;

  /// 文本控制器
  final TextEditingController? controller;

  /// 占位符文本
  final String? hintText;

  /// 标签文本
  final String? labelText;

  /// 字体大小
  final double fontSize;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 最大输入长度
  final int? maxLength;

  /// 是否隐藏文本（密码输入）
  final bool obscureText;

  /// 是否展开填充
  final bool isExpanded;

  /// 焦点节点
  final FocusNode? focusNode;

  /// 占位符样式
  final TextStyle? hintStyle;

  /// 文本样式
  final TextStyle? style;

  /// 文本输入动作
  final TextInputAction? textInputAction;

  /// 输入格式化器
  final List<TextInputFormatter>? inputFormatters;

  /// 键盘外观
  final Brightness? keyboardAppearance;

  /// 内容内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 前缀图标
  final Widget? prefixIcon;

  /// 后缀图标
  final Widget? suffixIcon;

  /// 最大行数
  final int? maxLines;

  /// 输入装饰
  final InputDecoration? decoration;

  /// 最小行数
  final int? minLines;

  /// 文本变化回调
  final Function(String)? onChange;

  /// 提交回调
  final Function(String)? onSubmitted;

  /// 点击回调
  final VoidCallback? onTap;

  /// 是否启用
  final bool? enabled;

  /// 是否只读
  final bool? readOnly;

  /// 光标颜色
  final Color? cursorColor;

  /// 编辑完成回调
  final VoidCallback? onEditingComplete;

  /// 文本垂直对齐方式
  final TextAlignVertical? textAlignVertical;

  /// 是否自动获取焦点
  final bool autofocus;

  /// 填充颜色
  final Color? fillColor;

  /// 是否填充
  final bool? filled;

  /// 边框
  final InputBorder? border;

  /// 获取焦点时的边框
  final InputBorder? focusedBorder;

  /// 启用时的边框
  final InputBorder? enabledBorder;

  /// 错误文本
  final String? errorText;

  /// 帮助文本
  final String? helperText;

  /// 计数器文本
  final String? counterText;

  const TextFieldConfig({
    this.textAlign = TextAlign.left,
    this.controller,
    this.hintText,
    this.labelText,
    this.fontSize = 14,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.isExpanded = true,
    this.focusNode,
    this.hintStyle,
    this.style,
    this.textInputAction,
    this.inputFormatters,
    this.keyboardAppearance,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.decoration,
    this.minLines,
    this.onChange,
    this.onSubmitted,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.cursorColor,
    this.onEditingComplete,
    this.textAlignVertical,
    this.autofocus = false,
    this.fillColor,
    this.filled,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorText,
    this.helperText,
    this.counterText,
  });
}

/// 创建通用列表项组件
/// 支持自定义左右内容、箭头、分割线等
/// 使用配置类减少参数数量，提高代码可维护性
Widget buildNormalItemWidget(NormalItemConfig config) {
  return InkWell(
    onTap: config.isTappable && config.onTap != null
        ? () => config.onTap!(config.index)
        : null,
    child: Container(
      height: config.height,
      padding: config.padding,
      decoration: config.decoration ??
          BoxDecoration(
            color: config.backgroundColor ?? Colors.white,
            borderRadius: config.borderRadius,
          ),
      child: Column(
        children: [
          SizedBox(
            height: config.height - 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: config.mainAxisAlignment,
                    children: [
                      // 左侧内容：优先使用自定义组件，否则显示文本
                      config.leftWidget ??
                          Text(
                            config.title ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: config.type == 0
                                  ? HzyNormalColorS.col222222
                                  : HzyNormalColorS.col666666,
                            ),
                          ),
                      // 右侧内容：优先使用自定义组件，否则显示文本
                      config.rightWidget ??
                          Text(
                            config.message ?? "",
                            style: HzyTextStyle.fontMedium(
                              size: 14,
                              color: HzyNormalColorS.col222222,
                            ),
                          ),
                    ],
                  ),
                ),
                // 右侧箭头：根据配置决定是否显示
                config.showNext
                    ? config.arrowWidget ??
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: config.arrowColor,
                        )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          // 分割线：根据配置决定是否显示
          config.showLine
              ? config.lineWidget ?? HzyNormalTools.buildDividerLine()
              : const SizedBox.shrink(),
        ],
      ),
    ),
  );
}

/// 兼容旧版本的函数（已废弃，建议使用 buildNormalItemWidget）
@Deprecated('请使用 buildNormalItemWidget(NormalItemConfig config) 替代')
Widget createNormalItemWidget({
  String? title,
  String? messge,
  bool? isshowline = false,
  MainAxisAlignment? mainAxisAlignment = MainAxisAlignment.spaceBetween,
  bool? isshownext = false,
  int type = 0,
  double height = 50,
  EdgeInsetsGeometry? padding = const EdgeInsets.only(left: 20),
  bool? istap = false,
  int? index = 0,
  Color? arrowrightColor = HzyNormalColorS.col666666,
  Widget? leftwidget,
  Widget? rightwidget,
  Widget? arrowrightwidget,
  Widget? linewidget,
  BoxDecoration? decoration,
  Color? backgroundColor,
  BorderRadius? borderRadius,
  Function(int)? ontap,
}) {
  return buildNormalItemWidget(
    NormalItemConfig(
      title: title,
      message: messge,
      showLine: isshowline ?? false,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      showNext: isshownext ?? false,
      type: type,
      height: height,
      padding: padding ?? const EdgeInsets.only(left: 20),
      isTappable: istap ?? false,
      index: index ?? 0,
      arrowColor: arrowrightColor ?? HzyNormalColorS.col666666,
      leftWidget: leftwidget,
      rightWidget: rightwidget,
      arrowWidget: arrowrightwidget,
      lineWidget: linewidget,
      decoration: decoration,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      onTap: ontap,
    ),
  );
}

/// 创建圆角向右箭头图标
/// 用于列表项或导航场景
Widget buildRoundedArrowIcon({
  Color color = HzyNormalColorS.col666666,
  double size = 20,
}) {
  return Icon(
    Icons.arrow_forward_ios_rounded,
    color: color,
    size: size,
  );
}

/// 创建普通向右箭头图标
/// 用于列表项或导航场景
Widget buildArrowIcon({
  Color color = HzyNormalColorS.col666666,
  double size = 20,
}) {
  return Icon(
    Icons.arrow_forward_ios,
    color: color,
    size: size,
  );
}

/// 兼容旧版本的圆角箭头函数（已废弃）
@Deprecated('请使用 buildRoundedArrowIcon 替代')
configArrowForwardIosRounded({
  double? size = 20,
  Color? color,
}) {
  return buildRoundedArrowIcon(
    color: color ?? HzyNormalColorS.col666666,
    size: size ?? 20,
  );
}

/// 兼容旧版本的普通箭头函数（已废弃）
@Deprecated('请使用 buildArrowIcon 替代')
configChevronRight({
  double? size = 20,
  Color? color,
}) {
  return buildArrowIcon(
    color: color ?? HzyNormalColorS.col666666,
    size: size ?? 20,
  );
}

/*
 * @description: 默认弹框
 * @param
 * {
 *    barrierDismissible: 点击屏幕关闭弹框
 *    dialogBackColor: 弹框背景颜色
 *    body: 自定义弹框内容
 *    titleWidget: 自定义提示语Widget
 *    title: 提示语
 *    titleColor: 提示语字体颜色
 *    titleFontSize: 提示语字体大小
 *    msgWidget: 提示内容自定义Widget
 *    msg: 显示内容
 *    msgColor: 提示内容字体颜色
 *    msgFontSize: 提示内容字体大小
 *    btnWidget: 自定义底部按钮
 *    padding: 弹框内边距
 *    msgAndBtnSpace: 提示内容和底部按钮的间距
 *    titleAndMsgSpace: 标题与提示内容间距
 *    sureMsg: 确认按钮文字
 *    sureBgColor: 确认按钮背景颜色
 *    sureTitleColor: 确认按钮字体颜色
 *    cannerMsg: 取消按钮文字
 *    cannerBgColor: 取消按钮背景颜色
 *    cannerTitleColor: 取消按钮字体颜色
 *    tapSure: 确认按钮点击事件
 *    tapCanner: 取消按钮点击事件
 *    space: 两个按钮间距
 *    layoutType: 1 左右 2 上下
 *    btnType:  按钮样式 1 一个按钮 2 两个按钮
 * }
 * @return {*}
 */

/// 显示通用对话框
/// 使用配置类简化参数传递，支持自定义样式和回调
Future<void> showNormalDialog({
  required BuildContext context,
  required DialogConfig config,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: config.barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        title: config.title != null ? Text(config.title!) : null,
        content: config.content != null ? Text(config.content!) : null,
        titleTextStyle: config.titleStyle,
        contentTextStyle: config.contentStyle,
        backgroundColor: config.backgroundColor,
        shape: config.shape,
        actions: [
          // 取消按钮
          if (config.cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                config.onCancel?.call();
              },
              style: config.cancelButtonStyle,
              child: Text(config.cancelText!),
            ),
          // 确认按钮
          if (config.confirmText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                config.onConfirm?.call();
              },
              style: config.confirmButtonStyle,
              child: Text(config.confirmText!),
            ),
        ],
      );
    },
  );
}

/// 兼容旧版本的对话框函数（已废弃，建议使用新版本）
@Deprecated(
    '请使用 showNormalDialog(context: context, config: DialogConfig(...)) 替代')
showNormalDialogOld({
  required BuildContext context,
  String? title,
  String? content,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) {
  return showNormalDialog(
    context: context,
    config: DialogConfig(
      title: title,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
    ),
  );
}

/// 创建通用文本输入框
/// 使用配置类简化参数传递，支持丰富的自定义选项
Widget buildNormalTextField(TextFieldConfig config) {
  Widget body = TextField(
    controller: config.controller,
    obscureText: config.obscureText,
    keyboardType: config.keyboardType,
    maxLines: config.maxLines,
    minLines: config.minLines,
    enabled: config.enabled,
    readOnly: config.readOnly ?? false,
    maxLength: config.maxLength,
    inputFormatters: config.inputFormatters,
    textAlign: config.textAlign,
    textAlignVertical: config.textAlignVertical,
    autofocus: config.autofocus,
    focusNode: config.focusNode,
    textInputAction: config.textInputAction,
    keyboardAppearance: config.keyboardAppearance,
    cursorColor: config.cursorColor,
    style: config.style ??
        HzyTextStyle.fontMedium(
          size: config.fontSize,
          color: HzyNormalColorS.col222222,
        ),
    decoration: config.decoration ??
        InputDecoration(
          hintText: config.hintText,
          labelText: config.labelText,
          prefixIcon: config.prefixIcon,
          suffixIcon: config.suffixIcon,
          contentPadding: config.contentPadding,
          fillColor: config.fillColor,
          filled: config.filled,
          border: config.border ?? InputBorder.none,
          focusedBorder: config.focusedBorder,
          enabledBorder: config.enabledBorder,
          errorText: config.errorText,
          helperText: config.helperText,
          counterText: config.counterText ?? "",
          hintStyle: config.hintStyle ??
              HzyTextStyle.fontMedium(
                size: config.fontSize,
                color: HzyNormalColorS.colcccccc,
              ),
        ),
    onTap: config.onTap,
    onChanged: config.onChange,
    onSubmitted: config.onSubmitted,
    onEditingComplete: config.onEditingComplete,
  );

  if (config.isExpanded) {
    body = Expanded(child: body);
  }

  return body;
}

/// 兼容旧版本的文本输入框函数（已废弃，建议使用新版本）
@Deprecated('请使用 buildNormalTextField(TextFieldConfig config) 替代')
Widget createNormaltfWidget({
  required BuildContext context,
  TextAlign textAlign = TextAlign.left,
  TextEditingController? textEditingController,
  String? hintText,
  double? fontsize = 14,
  TextInputType? keyboardType,
  int? maxLength,
  bool obscureText = false,
  bool isExpanded = true,
  FocusNode? focusNode,
  TextStyle? hintStyle,
  TextStyle? style,
  TextInputAction? textInputAction,
  List<TextInputFormatter>? inputFormatters,
  Brightness? keyboardAppearance,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLines = 1,
  InputDecoration? decoration,
  int? minLines,
  Function(String value)? onChange,
  Function? ontap,
  bool? enabled,
  Color? cursorColor,
  Function? onEditingComplete,
}) {
  return buildNormalTextField(
    TextFieldConfig(
      textAlign: textAlign,
      controller: textEditingController,
      hintText: hintText,
      fontSize: fontsize ?? 14,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      isExpanded: isExpanded,
      focusNode: focusNode,
      hintStyle: hintStyle,
      style: style,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      keyboardAppearance: keyboardAppearance,
      contentPadding: contentPadding,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLines: maxLines,
      decoration: decoration,
      minLines: minLines,
      onChange: onChange,
      onTap: ontap != null ? () => ontap() : null,
      enabled: enabled,
      cursorColor: cursorColor,
      onEditingComplete: onEditingComplete != null
          ? () {
              HzyNormalTools.keydissMiss(context);
              onEditingComplete();
            }
          : () => HzyNormalTools.keydissMiss(context),
    ),
  );
}

/// 将文本输入框的光标移动到文本末尾
/// 常用于程序化设置文本内容后，确保光标位置正确
///
/// [controller] 需要操作的文本编辑控制器
void moveCursorToEnd(TextEditingController controller) {
  controller.selection = TextSelection.fromPosition(
    TextPosition(offset: controller.text.length),
  );
}

/// 兼容旧版本的光标控制函数（已废弃）
@Deprecated('请使用 moveCursorToEnd 替代')
keepCursorAtEnd(TextEditingController textEditingController) {
  moveCursorToEnd(textEditingController);
}

/// 保持光标在最后
TextEditingController configTextEndEditingController({
  String text = '',
}) {
  return TextEditingController.fromValue(
    TextEditingValue(
      // 设置内容
      text: text,
      // 保持光标在最后
      selection: TextSelection.fromPosition(
        TextPosition(
          affinity: TextAffinity.downstream,
          offset: text.length,
        ),
      ),
    ),
  );
}

/// 创建dialog
configDiaLogWidget({
  required Widget child,
  Color? backgroundColor,
  ShapeBorder? shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        15,
      ),
    ),
  ),
}) {
  return Dialog(
    backgroundColor: backgroundColor,
    shape: shape,
    child: child,
  );
}
