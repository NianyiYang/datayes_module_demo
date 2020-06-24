import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Native extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeState();
  }
}

class _NativeState extends State<Native> {
  // 注册 Channel
  static const nativeToFlutterChannel =
      const MethodChannel('com.datayes.demo/nativeToFlutter');
  static const flutterToNativeChannel =
      const MethodChannel('com.datayes.demo/flutterToNative');

  String _nativeParam = '监听中...';

  @override
  void initState() {
    super.initState();

    // 设置沉浸式状态栏


    // 监听 Native
    Future<dynamic> handler(MethodCall call) async {
      switch (call.method) {
        case 'nativeCallFlutter':
          setState(() {
            _nativeParam = call.arguments;
          });
          break;
      }
    }

    nativeToFlutterChannel.setMethodCallHandler(handler);
  }

  @override
  Widget build(BuildContext context) {
    // item builder
    RaisedButton buildButtonItem(String label) {
      return new RaisedButton(
        onPressed: () {
          flutterToNativeChannel
              .invokeMethod('jumpToNative', {'param': 'From Flutter'});
        },
        child: new Text(label),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text('测试跳转'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildButtonItem(
              "发送到Native",
            ),
            Text(_nativeParam,
                style: TextStyle(color: Colors.red),
                textDirection: TextDirection.ltr),
          ],
        ),
      ),
    );
  }
}
