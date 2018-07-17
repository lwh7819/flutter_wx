import 'package:flutter/material.dart';
import 'dart:async';

class ShowProgress extends StatefulWidget {
  ShowProgress(this.requestCallback);

  final Future<Null> requestCallback; //这里Null表示回调的时候不指定类型
  @override
  _ShowProgressState createState() => new _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {
  @override
  initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 10), () { //每隔10ms回调一次
      widget.requestCallback.then((Null) { //这里Null表示回调的时候不指定类型
        Navigator.of(context).pop(); //所以pop()里面不需要传参,这里关闭对话框并获取回调的值
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(), //获取控件实例
    );
  }
}