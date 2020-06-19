import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'main',
      home: new Native(),
    );
  }
}

class Native extends StatelessWidget {
  static const platform = const MethodChannel('com.datayes.demo/jump');

  @override
  Widget build(BuildContext context) {
    // item builder
    RaisedButton buildButtonItem(String label) {
      return new RaisedButton(
        onPressed: () {
          platform.invokeMethod('jumpToNative', {'param':'From Flutter'});
        },
        child: new Text(label),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text('测试跳转Native'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildButtonItem(
              "跳转到Native",
            ),
          ],
        ),
      ),
    );
  }
}
