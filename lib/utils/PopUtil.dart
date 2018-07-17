import 'package:flutter/material.dart';
import '../view/Dialog.dart';

class PopUtil {
  static showLoadingDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) =>
     new FullScreenDialog(
        isCenter: true,
        child: new CircularProgressIndicator(),
        canclable: false,
      ),
    );
  }

  static dismissLoadingDialog() {
    dismissDialog();
  }
}