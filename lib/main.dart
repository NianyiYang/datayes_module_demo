import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:datayesmoduledemo/widget/home_page.dart';
import 'package:datayesmoduledemo/widget/native_page.dart';
import 'package:datayesmoduledemo/widget/network_page.dart';

void main() => runApp(widgetForRouter(window.defaultRouteName));

Widget widgetForRouter(String route) {

  // 沉浸式
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }

  // 解析参数
  switch (route) {
    case '/':
      return MaterialApp(
        title: '默认页面',
        home: Home(),
      );
    case '/native':
      return MaterialApp(
        title: '原生通信',
        home: Native(),
      );
    case '/network':
      return MaterialApp(
        title: '网络请求',
        home: Network(),
      );
    default:
      return Center(
        child: Text('没有找到路由: $route',
            style: TextStyle(color: Colors.red),
            textDirection: TextDirection.ltr),
      );
  }
}
