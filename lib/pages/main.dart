import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/Home.dart';
import 'package:flutter_wechat/pages/FindView.dart';
import 'package:flutter_wechat/pages/ContactView.dart';
import 'package:flutter_wechat/pages/MineView.dart';
import 'package:flutter_wechat/utils/RouterUtil.dart';
import 'MyPageView.dart';
import 'SelfInspection/BaseInfo.dart';

void main() => runApp(new MyAppa());

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
        '/router/xktabbar': (BuildContext context) => new MyPageView(),
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
  final PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WeChat"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add, color: Colors.white,),
            onPressed: RouterUtil.NavigatorPush(context, new MyPageView()),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: listSet,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index, duration: new Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
        },
        currentIndex: _sindex,
        fixedColor: Colors.green,
      ),
      body: new LayoutBuilder(
        builder: (context, constraints) =>
        new NotificationListener(
            onNotification: (ScrollNotification note) {
              setState(() {
                _sindex = _pageController.page.round();
                print('sindex:${_sindex}');
              });
            },
            child: new PageView.custom(
              physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
              controller: _pageController,
              childrenDelegate: new SliverChildBuilderDelegate(
                    (context, index) => vcSet[index],
                childCount: 4,
              ),
            )
        ),
      ),
    );
  }
}
