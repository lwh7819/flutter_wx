import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

int _selectedItemIndex = 0;
String _value;

class BottomPicker extends StatefulWidget {
  @override
  _BottomPickerState createState() => new _BottomPickerState();
}

class _BottomPickerState extends State<BottomPicker> {
  List coolColorNames;

  @override
  void initState() {
    super.initState();
    coolColorNames = new List();
    coolColorNames.add('001');
    coolColorNames.add('002');
    coolColorNames.add('003');
    coolColorNames.add('004');
    coolColorNames.add('005');
    coolColorNames.add('006');
    coolColorNames.add('007');
    coolColorNames.add('008');
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
                  _value = coolColorNames[index];
                });
              },
              children: new List<Widget>.generate(
                  coolColorNames.length, (int index) {
                return new Center(child:
                new Text(coolColorNames[index]),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
