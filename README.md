# HZY Normal Tool

[![pub package](https://img.shields.io/pub/v/hzy_normal_tool.svg)](https://pub.dev/packages/hzy_normal_tool)
[![License](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

一个为 Flutter 开发者提供的综合性工具包，包含常用的 UI 组件、工具类、抽象类和配置文件，帮助开发者快速构建高质量的 Flutter 应用。

## ✨ 特性

-   🎨 **丰富的 UI 组件** - 提供常用的按钮、列表项、对话框等组件
-   🛠️ **实用工具类** - 包含页面状态管理、路由工具等实用功能
-   🏗️ **抽象基类** - 提供生命周期管理、主题配置等抽象类
-   🎯 **统一配置** - 预定义的颜色、文本样式和页面状态
-   📱 **高度可定制** - 支持自定义样式和行为
-   🚀 **开箱即用** - 简单易用的 API 设计

## 📦 安装

在你的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
    hzy_normal_tool: ^0.0.3
```

或者使用 Git 仓库：

```yaml
dependencies:
    hzy_normal_tool:
        git:
            url: https://gitee.com/tengteng_fan/hzy_normal_tool.git
```

然后运行：

```bash
flutter pub get
```

## 🚀 快速开始

```dart
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

// 使用预定义的颜色
Color primaryColor = HzyNormalColors.primaryColor;

// 创建通用列表项
Widget listItem = createNormalItemWidget(
  title: '设置',
  message: '应用设置',
  onTap: () {
    // 处理点击事件
  },
);

// 显示弹窗
showPopDiaLogWidget(
  context: context,
  title: '提示',
  content: '这是一个提示消息',
);
```

## 📁 项目结构

```
lib/
├── hzy_normal_abstract/     # 抽象类和 Mixin
│   ├── hzy_abs_attribute.dart
│   ├── hzy_appbar_mixin.dart
│   ├── hzy_body_mixin.dart
│   ├── hzy_layout_mixin.dart
│   ├── hzy_normal_launch_abs.dart
│   ├── hzy_normal_life_cycle_abs.dart
│   ├── hzy_normal_theme_abstract.dart
│   └── hzy_scaffol_mixin.dart
├── hzy_normal_config/       # 基础配置
│   ├── hzy_normal_colors.dart
│   ├── hzy_text_style.dart
│   └── page_state.dart
├── hzy_normal_tools/        # 工具类
│   ├── hzy_normal_tools.dart
│   └── hzy_router_tools.dart
├── hzy_normal_widgets/      # UI 组件
│   ├── hzy_appbar_generator.dart
│   ├── hzy_btn_widget.dart
│   ├── hzy_normal_item_widget.dart
│   ├── hzy_normal_widagets.dart
│   ├── hzy_place_holder_widget.dart
│   ├── hzy_pop_dia_log_widget.dart
│   ├── hzy_pop_select_image_widget.dart
│   └── hzy_sure_canner_btn_widget.dart
└── hzy_normal_tool.dart     # 主入口文件
```

## 🎯 主要功能

### UI 组件

#### 通用列表项

```dart
// 创建带箭头的列表项
Widget item = createNormalItemWidget(
  title: '个人信息',
  message: '查看和编辑个人信息',
  showNext: true,
  onTap: () {
    // 导航到个人信息页面
  },
);
```

#### 按钮组件

```dart
// 确认取消按钮组
Widget buttons = HzySureCancelBtnWidget(
  onSurePressed: () {
    // 确认操作
  },
  onCancelPressed: () {
    // 取消操作
  },
);
```

#### 弹窗组件

```dart
// 显示确认对话框
showPopDiaLogWidget(
  context: context,
  title: '删除确认',
  content: '确定要删除这个项目吗？',
  onConfirm: () {
    // 执行删除操作
  },
);
```

### 工具类

#### 页面状态管理

```dart
// 使用页面状态枚举
PageState currentState = PageState.loading;

// 根据状态显示不同UI
Widget buildContent() {
  switch (currentState) {
    case PageState.loading:
      return CircularProgressIndicator();
    case PageState.success:
      return YourContentWidget();
    case PageState.error:
      return ErrorWidget();
    default:
      return Container();
  }
}
```

#### 回调函数类型

```dart
// 使用预定义的回调类型
IndexTapCallback onItemTap = (int index) {
  print('点击了第 $index 个项目');
};

BooleanCallback onToggle = (bool value) {
  print('开关状态: $value');
};
```

### 抽象类和 Mixin

#### 生命周期管理

```dart
class MyPage extends StatefulWidget with HzyNormalLifeCycleAbs {
  @override
  void onPageInit() {
    // 页面初始化
  }

  @override
  void onPageDispose() {
    // 页面销毁
  }
}
```

#### AppBar Mixin

```dart
class MyPage extends StatefulWidget with HzyAppBarMixin {
  @override
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text('我的页面'),
      backgroundColor: HzyNormalColors.primaryColor,
    );
  }
}
```

### 配置文件

#### 颜色配置

```dart
// 使用预定义颜色
Color primary = HzyNormalColors.primaryColor;
Color background = HzyNormalColors.backgroundColor;
Color text = HzyNormalColors.textColor;
```

#### 文本样式

```dart
// 使用预定义文本样式
TextStyle title = HzyTextStyle.titleStyle;
TextStyle subtitle = HzyTextStyle.subtitleStyle;
TextStyle body = HzyTextStyle.bodyStyle;
```

## 📖 API 文档

### 核心组件

| 组件                     | 描述           | 主要参数                                   |
| ------------------------ | -------------- | ------------------------------------------ |
| `createNormalItemWidget` | 创建通用列表项 | `title`, `message`, `onTap`, `showNext`    |
| `showPopDiaLogWidget`    | 显示弹窗       | `context`, `title`, `content`, `onConfirm` |
| `HzySureCancelBtnWidget` | 确认取消按钮组 | `onSurePressed`, `onCancelPressed`         |
| `HzyAppBarGenerator`     | AppBar 生成器  | `title`, `backgroundColor`, `actions`      |

### 工具类

| 类/方法          | 描述         | 用途               |
| ---------------- | ------------ | ------------------ |
| `HzyNormalTools` | 通用工具类   | 提供各种实用方法   |
| `HzyRouterTools` | 路由工具类   | 页面导航和路由管理 |
| `PageState`      | 页面状态枚举 | 统一页面状态管理   |

## 🔧 自定义配置

你可以通过继承或实现相关抽象类来自定义组件行为：

```dart
// 自定义主题
class MyTheme implements HzyNormalThemeAbstract {
  @override
  Color get primaryColor => Colors.blue;

  @override
  TextStyle get titleStyle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

// 自定义页面基类
class MyBasePage extends StatefulWidget with HzyScaffolMixin {
  @override
  Widget buildBody() {
    return YourCustomContent();
  }
}
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## 📄 许可证

本项目采用 BSD 3-Clause 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 🔗 相关链接

-   [Pub.dev](https://pub.dev/packages/hzy_normal_tool)
-   [GitHub](https://github.com/your-username/hzy_normal_tool)
-   [Gitee](https://gitee.com/tengteng_fan/hzy_normal_tool)

## 📞 联系方式

如果你有任何问题或建议，请通过以下方式联系我们：

-   提交 [Issue](https://gitee.com/tengteng_fan/hzy_normal_tool/issues)

---

**感谢使用 HZY Normal Tool！** 🎉
