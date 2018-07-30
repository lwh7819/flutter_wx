import 'package:flutter/material.dart';
import 'BottomPicker.dart';
import 'RadioGroup.dart';
import 'package:flutter_wechat/utils/DateUtils.dart';

class CommonRow extends StatefulWidget {
  CommonRow(this.title, this.valueBody,
      {Key key,
        this.hideDiver = false,
      }) :super(key: key)


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

Widget TextComponent(title, value) {
  return new CommonRow(
    title,
    new Text(value,
      style: new TextStyle(color: Color(0XFF999999), fontSize: 15.0),),);
}

Widget EditComponent(title, value, enable) {
  return CommonRow(
      title,
      new TextField(
        controller: new TextEditingController(text: value),
        decoration: new InputDecoration.collapsed(hintText: '请输入',
            hintStyle: new TextStyle(
                color: Color(0XFF999999), fontSize: 15.0)),
        enabled: enable,
      ));
}

Widget PickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Text(value?.length == 0 ? '请选择' : value,
            style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
        ),
        new Icon(Icons.chevron_right, color: Colors.grey,),
      ],
    ),
    onTap: enable ? () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new BottomPicker();
        },
      ).then(onChecked);
    } : (){},
  ));
}

Widget RadioComponent(title, data, defaultValue, type, enable, onChanged) {
  return CommonRow(
      title, new RadioGroup(
    data, defaultValue: defaultValue, type: type, onChanged: onChanged, enable: enable,
  ),
  );
}

Widget DatePickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Text(value == null ? '请选择' : DateUtils.formatDateSimple(value),
            style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
        ),
        new Icon(Icons.chevron_right, color: Colors.grey,),
      ],
    ),
    onTap: enable ? () {
      showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1970),
          lastDate: new DateTime(2050)).then(onChecked);
    } : (){},
  ));
}

Widget DateTimePickerComponent(context, title, value, enable, onChecked) {
  return CommonRow(title, new GestureDetector(
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Text(value == null ? '请选择' : DateUtils.formatDateTime(value),
            style: new TextStyle(color: Color(0XFF666666), fontSize: 15.0),),
        ),
        new Icon(Icons.chevron_right, color: Colors.grey,),
      ],
    ),
    onTap: enable ? () {
      showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1970),
          lastDate: new DateTime(2050))
          .then((DateTime dateTime){
        showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(dateTime)
        ).then(onChecked);
      });
    } : (){},
  ));
}

Widget _commonRow(title, Widget valueBody, hideDiver) {
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
                !hideDiver ? new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new Container(
                    height: 2.0,
                    color: Colors.grey[100],
                  ),
                ) : new SizedBox(height: 0.0,)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}