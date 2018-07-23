import 'package:flutter/material.dart';

showSnackBar(BuildContext ctx, String title) {
  Scaffold.of(ctx).removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
  SnackBar snackBar;
  snackBar = new SnackBar(
    content: new Text(title),
    duration: const Duration(seconds: 3),
  );
  Scaffold.of(ctx).showSnackBar(snackBar);
}

showSnackBarWithButton(BuildContext ctx, String title, String label, Function onPress) {
  SnackBar snackBar;
  Scaffold.of(ctx).removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
  snackBar = new SnackBar(
    content: new Text(title),
    duration: const Duration(seconds: 3),
    action: new SnackBarAction(label: label, onPressed: onPress),
  );
  Scaffold.of(ctx).showSnackBar(snackBar);
}