import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/XKTabBar.dart';
import '../utils/RouterUtil.dart';
import '../services/ServierApi.dart';
import '../utils/DialogUtil.dart';
import '../view/BaseDialog.dart';
import '../model/TestModel.dart';
//import 'CommonView.dart';
import 'BaseView.dart';

String val;

class HomeView1 extends BaseView {
  @override
  State<StatefulWidget> createBaseState() {
    return new _HomeViewState();
  }

}

class _HomeViewState extends BaseViewState {
  @override
  void initState() {
    super.initState();
    loadData()();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return new Scaffold(
      body: new Builder(
          builder: (BuildContext context) {
            return new Column(children: <Widget>[
              new Expanded(child: getCurrentBody(),),
            ],);
          }
      ),
    );
  }

  @override
  Widget createStateWidget() {
    List<String> _title = new List();
    _title.add('班主任');
    _title.add('数学老师');
    _title.add('英语老师');
    _title.add('语文老师');
    _title.add('科学老师');
    _title.add('生物老师');
    _title.add('物理老师');
    _title.add(val);
    List<String> _img = new List();
    _img.add("assets/images/img.jpg");
    _img.add("assets/images/a001.jpg");
    _img.add("assets/images/a002.jpg");
    _img.add("assets/images/a003.jpg");
    _img.add("assets/images/a004.jpg");
    _img.add("assets/images/a005.jpg");
    _img.add("assets/images/xk.jpg");
    _img.add("assets/images/lebron.jpg");
    List<Widget> _listTitles = new List();
    for (int i = 0; i < _title.length * 2; i++) {
      var index = i ~/ 2; // i初以2向下取整
      if (i % 2 == 0) {
        i == 0 ? null : _listTitles.add(
            new Divider(height: 16.0, indent: 16.0));
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
        leading: new Image.asset(
            _img[index], width: 40.0, height: 40.0, fit: BoxFit.cover),
        subtitle: new Text('你高考满分了你知道吗？'),
        trailing: new Text('09:06'),
        onTap: RouterUtil.NavigatorPush(context, new XkTabBar())
    );
  }

  @override
  Function loadData() {
      return () {
        setState(() {
          isError = false;
          hasLoad = false;
        });
        httpClient1(
          context,
              (Map map) {
            TestModel testModel = new TestModel.fromJson(map);
            print("lwhh" + testModel.origin);
            setState(() {
              val = testModel.origin;
              hasLoad = true;
            });
          },
              (error) {
            print(error.toString());
            setState(() {
              isError = true;
              errorMsg = error.toString();
            });
          },
        );
      };
  }
}