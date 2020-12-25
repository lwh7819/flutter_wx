import 'package:flutter/material.dart';
import 'BottomPicker.dart';
import 'RadioGroup.dart';
import 'package:flutter_wechat/utils/DateUtils.dart';
import 'dart:async';
import 'MapData.dart';

var commonpadding = const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 20.0);

class CommonRow extends StatefulWidget {
  CommonRow(this.title, this.valueBody,
      {Key key,
        this.hideDiver = false,
      }) :super(key: key);


  // ignore: missing_function_body
  String title;
  Widget valueBody;
  bool hideDiver;

  @override
  _CommonRowState createState() => new _CommonRowState();
}

class _CommonRowState extends State<CommonRow> {
  @override
  Widget build(BuildContext context) {
    return _commonRow(widget.title, widget.valueBody, widget.hideDiver);
  }
}

//创建只读文字行
Widget TextComponent(title, value) {
  return new CommonRow(
    title,
    new Container(
        padding: commonpadding,
        child: new Text(value,
          style: new TextStyle(color: Color(0XFF999999), fontSize: 15.0),)),);
}

//创建输入框
Widget EditComponent(title, value, enable, onValueChanged) {
  return CommonRow(
      title,
      new Container(
        padding: commonpadding,
        width: 240.0,
        child: new TextField(
          style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),
          controller: new TextEditingController(text: value),
          decoration: new InputDecoration.collapsed(hintText: '请输入',
              hintStyle: new TextStyle(
                  color: Color(0XFF999999), fontSize: 15.0)),
          enabled: enable,
          onChanged: onValueChanged,
        ),
      ));
}

//创建输入框
Widget EditComponent1(title, value, enable, onValueChanged, onComplete) {
  return CommonRow(
      title,
      new Container(
        padding: commonpadding,
        width: 240.0,
        child: new TextField(
          style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),
          controller: new TextEditingController(text: value),
          decoration: new InputDecoration.collapsed(hintText: '请输入',
              hintStyle: new TextStyle(
                  color: Color(0XFF999999), fontSize: 15.0)),
          enabled: enable,
          onChanged: onValueChanged,
          onEditingComplete: onComplete,
        ),
      ));
}

//创建选择器
Widget PickerComponent(context, title, value, lists, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Container(
      padding: commonpadding,
      color: Colors.transparent,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(value == '' || value == -1 ? '请选择' : getResult(lists, value),
              style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
          ),
          new Icon(Icons.chevron_right, color: Colors.grey,),
        ],
      ),
    ),
    onTap: enable ? () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new BottomPicker(lists);
        },
      ).then(onChecked);
    } : () {},
  ));
}

//创建radioGroup
Widget RadioComponent(title, data, defaultValue, hideDiver, type, enable, onChanged) {
  return CommonRow(
    title, new RadioGroup(
    data, defaultValue: defaultValue,
    type: type,
    onChanged: onChanged,
    enable: enable,
  ),
    hideDiver: hideDiver,
  );
}

//创建单独日期选择器
Widget DatePickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Container(
      padding: commonpadding,
      color: Colors.transparent,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(value == null ? '请选择' : value,
              style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
          ),
          new Icon(Icons.chevron_right, color: Colors.grey,),
        ],
      ),),
    onTap: enable ? () {
      showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1970),
          lastDate: new DateTime(2050)).then((DateTime dt) {
        new Future<String>(() =>
            DateUtils.formatDateTime(dt)).then(onChecked);
      });
    } : () {},
  ));
}

//创建时间选择器
Widget TimePickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Container(
      padding: commonpadding,
      color: Colors.transparent,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(value == null ? '请选择' : value,
              style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
          ),
          new Icon(Icons.chevron_right, color: Colors.grey,),
        ],
      ),),
    onTap: enable ? () {
      showTimePicker(
        context: context,
        initialTime: new TimeOfDay.now(),
      ).then((TimeOfDay tod) {
        new Future<String>(() =>
            DateUtils.formatTimeSimple(tod)).then(onChecked);
      });
    } : () {},
  ));
}

//创建日期选择器精确到分钟
Widget DateTimePickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Container(
      padding: commonpadding,
      color: Colors.transparent,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text(value == null ? '请选择' : value,
              style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
          ),
          new Icon(Icons.chevron_right, color: Colors.grey,),
        ],
      ),),
    onTap: enable ? () {
      showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1970),
          lastDate: new DateTime(2050))
          .then((DateTime dateTime) {
        showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(dateTime)
        ).then((TimeOfDay tod) {
          new Future<String>(() =>
              DateUtils.formatDateTime(DateTime(
                  dateTime.year, dateTime.month, dateTime.day, tod.hour,
                  tod.minute))
          ).then(onChecked);
        });
      });
    } : () {},
  ));
}

TitleRow(title) =>
    new Container(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: new Text(
        title, style: new TextStyle(fontSize: 16.0, color: Colors.blue),
      ),
    );

Diver() =>
    new Row(
      children: <Widget>[
        new Container(
          width: 100.0,
          height: 2.0,
          color: Colors.white,
        ),
        new Expanded(
          child: new Container(
            child: new Container(
              height: 2.0,
              color: Colors.grey[100],
            ),
          ),
        ),
      ],
    );

//创建基础行
Widget _commonRow(title, Widget valueBody, hideDiver) {
  return new Container(
    color: Colors.white,
    child: new Column(children: <Widget>[
      new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: new Text(title),
            width: 100.0,
            alignment: Alignment.centerLeft,
          ),
          new Expanded(
            child: new Container(
//              padding: const EdgeInsets.only(left: 10.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: valueBody,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      new Row(
        children: <Widget>[
          new SizedBox(
            width: 100.0,
            height: 0.0,
          ),
          new Expanded(
            child: !hideDiver ? new Container(
              child: new Container(
                height: 2.0,
                color: Colors.grey[100],
              ),
            ) : new SizedBox(height: 0.0,),
          ),
        ],
      ),
    ],),
  );
}