import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_wechat/model/PageComponentModel.dart';

class MyPageComponent extends StatefulWidget {
  MyPageComponent(@required this.datas,
      {Key key,
        Function this.callback})
      : assert(datas.length > 1, 'list size must to be bigger than 1'),
        super(key: key);

  List<PageComponentModel> datas;
  Function callback;

  @override
  State<StatefulWidget> createState() => new MyPageComponentState();
}

class MyPageComponentState extends State<MyPageComponent> {

  Timer timer;
  final PageController _pageController = new PageController(initialPage: 1);
  double _currentPage = 1.0;
  int _index = 1;
  bool _isEndScroll = true;
  bool _currentState = true;
  List<PageComponentModel> imgs;

  @override
  void initState() {
    super.initState();

    imgs = new List();
    imgs.add(widget.datas[widget.datas.length - 1]);
    imgs.addAll(widget.datas);
    imgs.add(widget.datas[0]);

    timer = new Timer.periodic(new Duration(seconds: 3), (timer) {
      if (_isEndScroll) {
        print('lwh$_index');
        if (_index == imgs.length - 1) {
          _index = 1;
          _pageController.jumpToPage(_index);
        } else if (_index == 0) {
          _index = imgs.length - 1;
          _pageController.jumpToPage(_index);
        }
        _pageController.animateToPage(_index + 1,
            duration: new Duration(milliseconds: 500), curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new LayoutBuilder(
          builder: (context, constraints) =>
          new Stack(children: <Widget>[
            _pageView(constraints, widget.callback),
            _indicator(),
          ],
          )
      ),
    );
  }

  Widget _pageView(constraints, callback) =>
      new NotificationListener(
          onNotification: (ScrollNotification note) {
            if (note is ScrollEndNotification ||
                note is UserScrollNotification) {
              _currentState = true;
            } else {
              _currentState = false;
            }
            setState(() {
              _currentPage = _pageController.page;
              _index = _currentPage.round();
              _isEndScroll = _currentState;
            });
          },
          child: new PageView.custom(
            physics: const PageScrollPhysics(
                parent: const BouncingScrollPhysics()),
            controller: _pageController,
            childrenDelegate: new SliverChildBuilderDelegate(
                  (context, index) =>
              new GestureDetector(child: new _ChildPage(
                imgs[index].imgPath,
                title: imgs[index].title,
                parallaxOffset: constraints.maxWidth / 2.0 *
                    (index - _currentPage),
              ),
                onTap: callback,),
              childCount: imgs.length,
            ),
            onPageChanged: (index) {
              if (index == imgs.length - 1) {
                new Future.delayed(
                    new Duration(milliseconds: 200)).then((lwh) {
                  _pageController.jumpToPage(1);
                });
              } else if (index == 0) {
                new Future.delayed(
                    new Duration(milliseconds: 200)).then((lwh) {
                  _pageController.jumpToPage(imgs.length - 2);
                });
              }
            },
          )
      );

  Widget _indicator() {
    List<Widget> radios = new List();
    for (int i = 1; i < imgs.length - 1; i++) {
      if (_index == 0) {
        _index = imgs.length - 2;
      } else if (_index == imgs.length - 1) {
        _index = 0;
      }
      IconData iconData = _index == i ? Icons.radio_button_checked : Icons
          .radio_button_unchecked;
      Icon icon = new Icon(iconData, color: Colors.grey[100], size: 8.0,);
      radios.add(icon);
    }
    return new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: radios,
      ),
    );
  }
}

class _ChildPage extends StatelessWidget {
  _ChildPage(this.data, {
    Key key,
    this.parallaxOffset = 0.0,
    this.title,
  }) : super(key: key);

  final String title;
  final String data;
  final double parallaxOffset;

  @override
  Widget build(BuildContext context) =>
      new Center(
        child: new Center(
          child: new Stack(
            children: <Widget>[
              new FadeInImage.assetNetwork(
                imageScale: 0.0,
                placeholder: "assets/images/ic_error.png",
                image: data,
                fit: BoxFit.fill,),
              new Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      parallaxOffset, 0.0, 0.0),
                  child: Text(
                    title, style: new TextStyle(color: Colors.grey[100]),),
                ),
              ),
            ],
          ),
        ),
      );
}