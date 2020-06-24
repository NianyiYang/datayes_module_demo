import 'package:flutter/material.dart';

import 'layout_page.dart';
import 'native_page.dart';
import 'network_page.dart';
import 'industry_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEMO'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        alignment: Alignment.center,
//      margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text(
                '布局测试',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Layout()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                '原生交互',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Native()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                '网络请求',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Network()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                '行业轮动',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Industry()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
