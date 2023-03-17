/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 21:53:34
 * @LastEditors: TT
 * @LastEditTime: 2023-03-17 22:20:25
 */
import 'package:flutter/material.dart';
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
