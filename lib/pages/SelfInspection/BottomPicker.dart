import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

int _selectedItemIndex = 0;
var _value;

class BottomPicker extends StatefulWidget {
  BottomPicker(this.coolColorNames,{
    Key key,
  }) : super(key: key)

  // ignore: missing_function_body
  List coolColorNames;
  @override
  _BottomPickerState createState() => new _BottomPickerState();
}

class _BottomPickerState extends State<BottomPicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(children: <Widget>[
          new InkWell(
            child: new Container(child: new Text('取消'),
              padding: const EdgeInsets.all(15.0),),
            onTap: () {Navigator.of(context).pop();},
          ),
          new Expanded(child: new Text('')),
          new InkWell(
            child: new Container(child: new Text('确定'),
              padding: const EdgeInsets.all(15.0),),
            onTap: () {Navigator.of(context).pop(_value);},
          ),

        ],),
        _buildBottomPicker()
      ],
    );
  }

  //创建选择滚动列表
  Widget _buildBottomPicker() {
    final FixedExtentScrollController scrollController =
    new FixedExtentScrollController(initialItem: _selectedItemIndex);

    return new Container(
      height: 310.0,
      color: CupertinoColors.white,
      child: new DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: new GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {
            Navigator.of(context).pop(_value);
          },
          child: new SafeArea(
            child: new CupertinoPicker(
              scrollController: scrollController,
              itemExtent: 40.0,
              backgroundColor: CupertinoColors.white,
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedItemIndex = index;
                  _value = widget.coolColorNames[index]["value"];
                });
              },
              children: new List<Widget>.generate(
                  widget.coolColorNames.length, (int index) {
                return new Center(child:
                new Text(widget.coolColorNames[index]["label"]),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
