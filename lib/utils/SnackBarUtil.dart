import 'package:flutter/material.dart';

showSnackBar(BuildContext ctx, String title) {
  SnackBar snackBar = new SnackBar(
    content: new Text(title),
    duration: const Duration(seconds: 3),
  );
  Scaffold.of(ctx).showSnackBar(snackBar);
}

showSnackBarWithButton(BuildContext ctx, String title, String label, Function onPress) {
  SnackBar snackBar = new SnackBar(
    content: new Text(title),
    action: new SnackBarAction(label: label, onPressed: onPress),
    duration: const Duration(seconds: 5),
  );
  Scaffold.of(ctx).showSnackBar(snackBar);
}