/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 21:53:34
 * @LastEditors: TT
 * @LastEditTime: 2023-03-19 17:35:00
 */
import 'package:flutter/material.dart';
import 'package:hzy_normal_tool/hzy_normal_tools/hzy_normal_tools.dart';
import 'package:hzy_normal_tool/hzy_normal_widgets/hzy_normal_widgets_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  createListView() {
    Widget body = Column(
      children: [
        const HzySureAndCannerBtnWidget(
          cannerScale: 1,
          sureScale: 4,
        ),
        const HzySureAndCannerBtnWidget(
          layoutType: 2,
          cannerScale: 1,
          sureScale: 4,
        ),
        const HzySureAndCannerBtnWidget(
          btnType: 1,
          cannerScale: 1,
          sureScale: 4,
        ),
        HzySureAndCannerBtnWidget(
          cannerScale: 1,
          sureScale: 4,
          spaceWidget: Container(
            width: 1,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 9),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        HzySureAndCannerBtnWidget(
          cannerScale: 4,
          sureScale: 4,
          spaceWidget: Container(
            width: 1,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 9),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        HzySureAndCannerBtnWidget(
          layoutType: 2,
          spaceWidget: Container(
            width: 1,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 9),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        HzyPopDiaLogWidget(
          title: "温馨提示",
          tapSure: () {
            showPopDiaLogWidget(context: context);
          },
        ),
        HzyPopDiaLogWidget(
          title: "温馨提示",
          tapSure: () {
            showPopDiaLogWidget(
              barrierDismissible: false,
              context: context,
              msg: """
2023年，美国军舰数量锐减，自20世纪90年代以来
，美国海军从建造大量军舰的高峰期开始走下坡路。
而最近，美国军舰造舰出现了问题，连续几个月出现了多个事件，
让人不禁想到了当年苏联的末路。
但是，这种情况是否会给中国的发展提供启示呢？",
""",
            );
          },
          msg:
              "2023年，美国军舰数量锐减，自20世纪90年代以来，美国海军从建造大量军舰的高峰期开始走下坡路。而最近，美国军舰造舰出现了问题，连续几个月出现了多个事件，让人不禁想到了当年苏联的末路。但是，这种情况是否会给中国的发展提供启示呢？",
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: "大大说的",
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: "大大说的",
            rightType: 1,
          ),
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: "大大说的",
            rightType: 1,
            isShowLine: false,
          ),
        ),
        HzyNormalItemWidget(
          itemModel: HzyNormalItemModel(
            leftMsg: "大大说的",
            rightType: 3,
            isShowLine: true,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                16,
              ),
            ),
            lineColor: Colors.red,
            lineHeight: 0.5,
            isCanTap: true,
            rightMsg: "右边",
          ),
          tapItem: ({index}) {
            configShowBottomSheet(
              context: context,
              child: HzyPopSelectImageWidget(),
            );
          },
        ),
      ],
    );
    body = SingleChildScrollView(
      child: body,
    );
    body = Container(
      padding: const EdgeInsets.all(20),
      child: body,
    );
    return body;
  }
}
