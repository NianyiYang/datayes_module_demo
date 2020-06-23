import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => new _NetworkState();
}

class _NetworkState extends State<Network> {
  var _titles = <String>[];

  @override
  void initState() {
    super.initState();
    _request();
  }

  // 网络请求 使用原生请求
  _request() async {
//    var url = 'https://www.apiopen.top/journalismApi';
    var url = 'https://gw.wmcloud.com/rrp/mobile/whitelist/news/bigvsaid?pageIndex=1&pageCount=20';
    var httpClient = new HttpClient();

    final titles = <String>[];

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(Utf8Decoder()).join();
        var data = JsonDecoder().convert(json);

//        List list = data['data']['tech'];
        List list = data['bigViewSaidList']['infoNews'];
        //List list = netData['list'];

        list.forEach((item) {
          titles.add(item['title']);
        });
      }
    } catch (exception) {

    }

    if (!mounted) {
      return;
    }

    setState(() {
      _titles = titles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('新闻列表'),
      ),
      body: new ListView.builder(
          itemCount: _titles.length * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) {
              // 奇数
              return new Divider();
            }

            final index = i ~/ 2;

            return _buildRow(_titles[index]);
          }),
    );
  }

  Widget _buildRow(String title) {
    return new ListTile(
      title: new Text(
        title,
      ),
      onTap: () {
        setState(() {});
      },
    );
  }
}