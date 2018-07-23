import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/CommonData.dart';
import 'package:flutter_wechat/utils/DialogUtil.dart';

class XkTabBar extends StatefulWidget {
  @override
  XkViewState createState() => new XkViewState();
}

class XkViewState extends State<XkTabBar> with SingleTickerProviderStateMixin {
  Size deviceSize;
  AnimationController controller;
  Animation<double> animation;

  bool isLove = false;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: new AppBar(
        title: new Text('Detail'),
      ),
      body: CardList(),
    );
  }

  Widget CardList() {
    return new Opacity(
      opacity: animation.value,
      child: new ListView (
        children: ItemList(),
      ),
    );
  }

  List<Widget> ItemList() {
    List<Widget> itemList = new List();
    List<String> imgs = new List();
    imgs.add(UIData.image1);
    imgs.add(UIData.image2);
    imgs.add(UIData.image3);
    imgs.add(UIData.image4);
    imgs.add(UIData.image5);
    bool isLast = false;
    for (int i = 0; i < 5; i++) {
      i == 4 ? isLast = true : isLast = false;
      itemList.add(CardListItem(isLast, imgs[i], i));
    };
    return itemList;
  }

  Widget CardListItem(isLast, img, int i) {
    return new Center(
        child: new GestureDetector(
          child: new Container(
            height: deviceSize.height / 2,
            width: deviceSize.width * 0.9,
            child: new Card(
              margin: isLast
                  ? const EdgeInsets.only(top: 10.0, bottom: 10.0)
                  : const EdgeInsets.only(top: 10.0),
              color: Colors.white,
              elevation: 2.0,
              child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: new FadeInImage.assetNetwork(
                      width: deviceSize.width * 0.9,
                      placeholder: "assets/images/ic_error.png",
                      image: img,
                      fit: BoxFit.fill,),
                  ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: new Text('Title', style: new TextStyle(
                                    color: Colors.black, fontSize: 20.0),),
                                alignment: Alignment.centerLeft,
                              ),
                              new Container(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: new Text('This is content'),
                                alignment: Alignment.centerLeft,
                              ),
                              new SizedBox(height: 5.0,),
                              new Row(
                                children: <Widget>[
                                  new Icon(
                                    Icons.star, color: Colors.redAccent,),
                                  new Text('4.1',
                                      style: new TextStyle(color: Colors.blue)),
                                  new Expanded(
                                      flex: 1,
                                      child: new Container(
                                        child: new IconButton(
                                          icon: new Icon(Icons.favorite),
                                          color: isLove ? Colors.red : Colors
                                              .grey,
                                          onPressed: () {
                                            setState(() {
                                              isLove = !isLove;
                                            });
                                          },),
                                        alignment: Alignment.centerRight,
                                      ))
                                ],
                              )
                            ],
                          ),
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            showAlertDialogSingle(context, 'title', 'have hited $i', null);
          },
        )
    );
  }

}