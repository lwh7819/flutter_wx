import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  @override createState() => new ContactViewState();
}

class ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _createListView(),
    );
  }

  Widget _createListView() {
    List<String> _titles = new List();
    _titles.add('阿panda');
    _titles.add('张三的歌');
    _titles.add('班主任');
    _titles.add('LebronJames');
    _titles.add('石甲州');
    _titles.add('李思思');
    _titles.add('迪丽热巴');
    _titles.add('古力娜扎');
    List<String> _imgs = new List();
    _imgs.add('images/xk.jpg');
    _imgs.add('images/a001.jpg');
    _imgs.add('images/a002.jpg');
    _imgs.add('images/a003.jpg');
    _imgs.add('images/a004.jpg');
    _imgs.add('images/a005.jpg');
    _imgs.add('images/a001.jpg');
    _imgs.add('images/a002.jpg');
    List<Widget> _listTitles = new List();
    _listTitles.add(_createRow('top', Icons.add, '新的朋友'));
    _listTitles.add(_createRow('', Icons.group, '群聊'));
    _listTitles.add(_createRow('', Icons.label, '标签'));
    _listTitles.add(_createRow('bottom', Icons.person, '公众号'));
    for (int i = 0; i < _titles.length * 2; i++) {
      var index = i ~/ 2; // i初以2向下取整
      if (i % 2 == 0) {
        i == 0 ? null : _listTitles.add(
            new Divider(height: 16.0, indent: 16.0));
      } else {
        _listTitles.add(_createListRow(_imgs[index], _titles[index]));
      }
    }
    _listTitles.add(
      new Container(
        height: 20.0,
        color: Colors.grey[200],
      )
    );
    return new ListView(
      children: _listTitles,
    );
  }

  Widget _createListRow(icon, title) {
    return new ListTile(
      title: new Text(title),
      leading: new Image.asset(
          icon, width: 40.0, height: 40.0, fit: BoxFit.cover),
    );
  }

  Widget _createRow(type, img, title) {
    var padding;
    if (type == 'top') {
      padding =  EdgeInsets.only(top: 20.0);
    } else if (type == 'bottom') {
      padding =  EdgeInsets.only(bottom: 20.0);
    } else {
      padding = EdgeInsets.all(0.0);
    }
    return new Container(
      color: Colors.grey[200],
      padding: padding,
      child: new Container(
        child: new ListTile(
          title: new Text(title),
          leading: new Icon(img),
        ),
        height: 50.0,
        color: Colors.white,
      ),
    );
  }

}