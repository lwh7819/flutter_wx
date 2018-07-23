import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/Home.dart';
import 'package:flutter_wechat/pages/FindView.dart';
import 'package:flutter_wechat/pages/ContactView.dart';
import 'package:flutter_wechat/pages/MineView.dart';
import 'package:flutter_wechat/pages/XKTabBar.dart';
import 'package:flutter_wechat/utils/RouterUtil.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Center(
        child: new RandomWords(),
      ),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => new XkTabBar(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<BottomNavigationBarItem> listSet = [new BottomNavigationBarItem(
    icon: new Icon(Icons.chat), title: new Text("微信"),),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.perm_contact_calendar), title: new Text("通讯录"),),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.explore), title: new Text("发现"),),
  new BottomNavigationBarItem(
    icon: new Icon(Icons.person), title: new Text("我"),),
  ];
  final List vcSet = [
    new HomeView(), new ContactView(), new FindView(), new MineView()];
  int _sindex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WeChat"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add, color: Colors.white,),
              onPressed: RouterUtil.NavigatorPush(context, new XkTabBar()),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: listSet,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _sindex = index;
          });
          print("____$index");
        },
        currentIndex: _sindex,
        fixedColor: Colors.green,
      ),
      body: vcSet[_sindex],
    );
  }

}
