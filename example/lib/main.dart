/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-15 21:53:34
 * @LastEditors: TT
 * @LastEditTime: 2023-03-16 23:34:55
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              text: "点我",
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              btnLayoutType: BtnLayoutType.img,
              imageWidget: Icon(
                Icons.add,
              ),
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              btnLayoutType: BtnLayoutType.letfImg,
              imageWidget: Icon(
                Icons.add,
              ),
              text: "点我",
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              btnLayoutType: BtnLayoutType.rightImg,
              imageWidget: Icon(
                Icons.add,
              ),
              text: "点我",
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              btnLayoutType: BtnLayoutType.topImg,
              imageWidget: Icon(
                Icons.add,
              ),
              text: "点我",
            ),
            const HzyBtnWidget(
              height: 60,
              margin: EdgeInsets.all(10),
              btnLayoutType: BtnLayoutType.bottomImg,
              imageWidget: Icon(
                Icons.add,
              ),
              text: "点我",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
