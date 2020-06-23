// 第一个Flutter布局
import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'main',
      home: new Layout(),
    );
  }
}

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('标题栏'),
      ),
      body: ListView(
        children: [
          new Image.asset(
            'resources/ic_background.png',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          new TitleSection(),
          new TextSection(),
        ],
      ),
    );
  }
}

// 标题行
class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Demo 随便写的',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '花园纯牛奶花园纯牛奶花园纯牛奶花园',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          new FavoriteWidget(),
        ],
      ),
    );
  }
}

// 文本行
class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '而作为通讯桥梁就是MethodChannel了，这个类在初始化的时候需要注册一个渠道值。这个值必须是唯一的，并且在使用到的Native层和Flutter层互相对应',
        softWrap: true,
      ),
    );
  }
}

// 实现有状态类
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 10;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(0.0),
          child: new IconButton(
              icon: _isFavorite
                  ? new Icon(Icons.star)
                  : new Icon(Icons.star_border),
              color: _isFavorite ? Colors.red : Colors.grey,
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}