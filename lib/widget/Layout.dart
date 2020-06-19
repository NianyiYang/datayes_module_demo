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
        title: new Text('这是标题栏'),
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
          new ButtonSection(),
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
                  '花园纯牛奶花园纯牛奶花园纯牛奶花园纯牛奶？',
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

// 按钮行
class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // item builder
    GestureDetector buildButtonItem(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(icon, color: color),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                label,
                style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            )
          ],
        ),
        onTap: () {
          final snackBar = new SnackBar(content: new Text(label));
          Scaffold.of(context).showSnackBar(snackBar);
        },
      );
    }

    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonItem(Icons.call, "电话"),
          buildButtonItem(Icons.near_me, "定位"),
          buildButtonItem(Icons.share, "分享"),
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
        '实现图像部分：四列元素中的三个现在已经完成，只剩下图像部分。该图片可以在Creative Commons许可下在线获得， 但是它非常大，且下载缓慢。在步骤0中，您已经将该图像包含在项目中并更新了pubspec文件，所以现在可以从代码中直接引用它',
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