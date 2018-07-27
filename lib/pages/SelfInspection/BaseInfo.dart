import 'package:flutter/material.dart';
import 'BottomPicker.dart';
import 'dart:async';

class MyAppa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Center(
        child: new BaseInfo(),
      ),
    );
  }
}

class BaseInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BaseInfoState();
}

class _BaseInfoState extends State<BaseInfo> {
  String _type = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('title'),
        ),
        body: new Container(
          child: new ListView(
            children: <Widget>[
              TextComponent('单位名称', '江干卫生监督所'),
              TextComponent('专业类别', '事业单位'),
              EditComponent('注册地址', '默认值1'),
              EditComponent('地址', '默认值2'),
              PickerComponent(),
            ],
          ),
          color: Colors.grey[100],
        )
    );
  }

  Widget TextComponent(title, value) {
    return CommonRow(
        title,
        new Text(value,
          style: new TextStyle(color: Color(0XFF999999), fontSize: 15.0),));
  }

  Widget EditComponent(title, value) {
    return CommonRow(
        title,
        new TextField(
          controller: new TextEditingController(text: value),
          decoration: new InputDecoration.collapsed(hintText: '请输入',
              hintStyle: new TextStyle(
                  color: Color(0XFF999999), fontSize: 15.0)),
        ));
  }

  Widget PickerComponent() {
    return CommonRow('企业类型', new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(_type?.length == 0 ? '请选择' : _type,  style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
          ),
          new Icon(Icons.chevron_right, color: Colors.grey,),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return new BottomPicker();
          },
        ).then((str){
          setState(() {
            _type = str;
            print('lwh$_type');
          });
        });
      },
    ));
  }
}

Widget CommonRow(title, Widget valueBody) {
  return new Container(
    color: Colors.white,
    child: new Row(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: new Text(title),
          width: 100.0,
          alignment: Alignment.centerLeft,
        ),
        new Expanded(
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: valueBody,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Container(
                    height: 2.0,
                    color: Colors.grey[100],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

