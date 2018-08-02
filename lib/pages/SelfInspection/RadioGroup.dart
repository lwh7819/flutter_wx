import 'package:flutter/material.dart';
import 'dart:convert';

enum RadioLayoutType {
  SingleLine,
  DoubleLine,
  SingleList,
}

class RadioGroup extends StatefulWidget {
  RadioGroup(this.data,
      {Key key,
        this.defaultValue,
        this.type,
        this.onChanged,
        this.enable = true}) : super(key: key)

  // ignore: missing_function_body
  List data;
  int defaultValue = -1;
  Function onChanged;
  RadioLayoutType type;
  bool enable;

  @override
  _RadioGroupState createState() => new _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  Widget body;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case RadioLayoutType.SingleLine:
        body = _singleLine();
        break;
      case RadioLayoutType.DoubleLine:
        body = _doubleLine();
        break;
      case RadioLayoutType.SingleList:
        body = _lineSingleList();
        break;
      default:
        body = _lineSingleList();
        break;
    }
    return new Container(
      child: body,
    );
  }

  Widget _createRadio(value, title) {
    return new Expanded(
        child: new RadioListTile(
          value: value,
          groupValue: widget.defaultValue,
          title: new Text(title,),
          onChanged: widget.enable? widget.onChanged : (e){},
          selected: value == widget.defaultValue,
          activeColor: widget.enable? Colors.blue : Colors.blue[300],
        )
    );
  }

  Widget _singleLine() {
    return new Column(
        children: <Widget>[
          new Row(
              children: <Widget>[
                _createRadio(
                    getValue(widget.data[0]), getLabel(widget.data[0])),
                _createRadio(
                    getValue(widget.data[1]), getLabel(widget.data[1])),
              ]
          ),
        ]
    );
  }

  Widget _doubleLine() {
    return new Column(
        children: <Widget>[
          new Row(
              children: <Widget>[
                _createRadio(
                    getValue(widget.data[0]), getLabel(widget.data[0])),
                _createRadio(
                    getValue(widget.data[1]), getLabel(widget.data[1])),
              ]
          ),
          new Row(
              children: <Widget>[
                _createRadio(
                    getValue(widget.data[2]), getLabel(widget.data[2])),
                _createRadio(
                    getValue(widget.data[3]), getLabel(widget.data[3])),
              ]
          )
        ]
    );
  }

  Widget _lineSingleList() {
    List<Widget> radios = new List();
    for (int i = 0; i < widget.data.length; i++) {
      radios.add(new RadioListTile(
        value: getValue(widget.data[i]),
        groupValue: widget.defaultValue,
        title: new Text(getLabel(widget.data[i])),
        onChanged: widget.onChanged,
      ));
    }
    return new Column(children: radios,);
  }
}

String getLabel(data) {
  String jsonStr = json.encode(data);
  Map map = json.decode(jsonStr);
  String str = map["label"];
  return str;
}

int getValue(data) {
  String jsonStr = json.encode(data);
  Map map = json.decode(jsonStr);
  int value = map["value"];
  return value;
}
