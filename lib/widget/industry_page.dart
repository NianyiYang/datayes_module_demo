import 'package:flutter/material.dart';

class Industry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndustryState();
}

class IndustryState extends State<Industry>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Color(0xFF404040),
        ),
        title: TitleSection(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(38.0),
          child: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(text: '行业分析'),
              Tab(text: '成份股优选'),
            ],
            labelColor: Color(0xFF3d7dff),
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Color(0xFF333333),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
            indicatorWeight: 2,
            indicatorColor: Color(0xFF3d7dff),
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller,
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          First(),
          Second(),
        ],
        controller: controller,
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '生物制品',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 18.0,
            ),
          ),
          Text(
            '21:00 数据已更新',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            '成份股阶段涨幅TOP3',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '第二个',
      ),
    );
  }
}
