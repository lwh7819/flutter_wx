import 'package:flutter/material.dart';
import '../view/BaseDialog.dart';
import 'package:flutter_wechat/utils/CommonData.dart';

showLoadingDialog(ctx) {
  showDialog(
    context: ctx,
    builder: (ctx) =>
    new FullScreenDialog(
      isCenter: true,
      child: new CircularProgressIndicator(
        valueColor: new ValueColor(),
      ),
      canclable: false,
    ),
  );
}

showAlertDialogSingle(BuildContext ctx, String title, String content,
    postiveCallback) {
  showDialog(
    context: ctx,
    builder: (context) =>
    new FullScreenDialog(
      isCenter: true,
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text(UIData.confirm),
            onPressed: postiveCallback ?? () => Navigator.pop(context),
          ),
        ],
      ),
      canclable: false,
    ),
  );
}

showAlertDialogDouble(BuildContext ctx, String title, String content,
    postiveCallback, negativeCallback) {
  showDialog(
    context: ctx,
    builder: (context) =>
    new FullScreenDialog(
      isCenter: true,
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text(UIData.confirm),
            onPressed: postiveCallback ?? () => Navigator.pop(context),
          ),
          FlatButton(
            child: Text(UIData.cancel),
            onPressed: negativeCallback ?? () => Navigator.pop(context),
          ),
        ],
      ),
      canclable: false,
    ),
  );
}

void hideDialog() {
  dismissDialog();
}


class ValueColor extends Animation<Color> {

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Color get value => Colors.yellow;
}
