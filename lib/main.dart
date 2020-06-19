import 'package:flutter/material.dart';
import 'package:datayesmoduledemo/widget/Layout.dart';
import 'package:datayesmoduledemo/widget/Native.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '欢迎使用Flutter',
      home: new Content(),
      theme: new ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        // BuildContext必须要是跳转路由的context才行
        '/layout': (BuildContext context) => new Layout(),
        '/native': (BuildContext context) => new Native(),
      },
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // item builder
    RaisedButton buildButtonItem(String route, String label) {
      return new RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        child: new Text(label),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('这是标题栏'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildButtonItem(
              '/layout',
              "第一个布局",
            ),
            buildButtonItem(
              '/native',
              "跳转到Native",
            ),
          ],
        ),
      ),
    );
  }
}
