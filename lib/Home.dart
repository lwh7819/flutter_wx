import 'package:flutter/material.dart';
import 'XKTabBar.dart';

class HomeView extends StatefulWidget {
  @override
  createState() => new _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    List<String> _title = new List();
    _title.add('班主任');
    _title.add('数学老师');
    _title.add('英语老师');
    _title.add('语文老师');
    _title.add('科学老师');
    _title.add('生物老师');
    _title.add('物理老师');
    _title.add('化学老师');
    List<String> _img = new List();
    _img.add("images/img.jpg");
    _img.add("images/a001.jpg");
    _img.add("images/a002.jpg");
    _img.add("images/a003.jpg");
    _img.add("images/a004.jpg");
    _img.add("images/a005.jpg");
    _img.add("images/xk.jpg");
    _img.add("images/lebron.jpg");
    List<Widget> _listTitles = new List();
    for (int i = 0; i < _title.length * 2; i++) {
      var index = i ~/ 2; // i初以2向下取整
      if(i % 2 == 0) {
        i == 0 ? null : _listTitles.add(new Divider(height: 16.0, indent: 16.0));
      } else {
        _listTitles.add(_buildRow(_title, _img, index));
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

  Widget _buildRow(_title, _img, index) {
    return new ListTile(
      title: new Text(_title[index]),
      leading: new Image.asset(_img[index], width: 40.0,height: 40.0,fit: BoxFit.cover),
      subtitle: new Text('你高考满分了你知道吗？'),
      trailing: new Text('09:06'),
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (context){
                  return new XkTabBar();
                }
            )
        );
      },
    );
  }

}