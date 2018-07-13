import 'package:flutter/material.dart';

class FindView extends StatefulWidget {
  @override
  createState() => new _FindViewState();
}

class _FindViewState extends State<FindView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return new ListView(
      children: <Widget>[
        _creageSingleRow(Icons.camera, "朋友圈"),
        _creageSingleRow(Icons.crop_free, "扫一扫"),
        _creageSingleRow(Icons.star, "看一看"),
        new Divider(height: 1.0, indent: 16.0,),
        _createDoubleRow(Icons.search, "搜一搜"),
        _creageSingleRow(Icons.people, "附近的人"),
        new Divider(height: 1.0, indent: 16.0,),
        _createDoubleRow(Icons.hourglass_empty, "漂流瓶"),
        _creageSingleRow(Icons.shopping_cart, "购物"),
        new Divider(height: 1.0, indent: 16.0,),
        _createDoubleRow(Icons.games, "游戏"),
        _creageSingleRow(Icons.apps, "小程序"),
        new Container(
          height: 20.0,
          color: Colors.grey[200],
        )
      ],
    );
  }

  Widget _creageSingleRow(icon, title) {
    return new Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: new Container(
        child: new ListTile(
          leading: new Icon(icon),
          title: new Text(title),
          trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
        ),
        color: Colors.white,
        height: 50.0,
      ),
      color: Colors.grey[200],
    );
  }

  Widget _createDoubleRow(icon, title) {
    return new Container(
      child: new ListTile(
        leading: new Icon(icon),
        title: new Text(title),
        trailing: new Icon(Icons.chevron_right, color: Colors.grey,),
      ),
      color: Colors.white,
      height: 50.0,
    );
  }
}