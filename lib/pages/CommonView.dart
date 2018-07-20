import 'package:flutter/material.dart';
import '../utils/DialogUtil.dart';
import '../view/BaseDialog.dart';

Widget createLoadingView() {
  return new FullScreenDialog(
    isCenter: true,
    child: new CircularProgressIndicator(
      valueColor: new ValueColor(),
    ),
    canclable: false,
  );
}

Widget createErrorView(String errorMsg, Function relode) {
  return new Center(
    child: new Column(children: <Widget>[
      new Text(errorMsg),
      new InkWell(
        child: new Text('点击重新加载', style: new TextStyle(color: Colors.blue),),
        onTap: relode,)
    ],),
  );
}