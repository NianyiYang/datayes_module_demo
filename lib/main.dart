import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:datayesmoduledemo/widget/Layout.dart';
import 'package:datayesmoduledemo/widget/Native.dart';
import 'package:datayesmoduledemo/widget/Network.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  // 解析参数
  switch (route) {
    case '/':
      return new MaterialApp(
        title: '默认页面',
        home: new Layout(),
      );
    case '/native':
      return new MaterialApp(
        title: '原生通信',
        home: new Native(),
      );
    case '/network':
      return new MaterialApp(
        title: '网络请求',
        home: new Network(),
      );
    default:
      return Center(
        child: Text('没有找到路由: $route',
            style: TextStyle(color: Colors.red),
            textDirection: TextDirection.ltr),
      );
  }
}
