import 'package:flutter/material.dart';

var ctx;
class FullScreenDialog extends StatefulWidget {
  final Widget child;
  final bool isCenter;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double width;
  final double height;
  final Function onTapOutside;
  final bool canclable;

  const FullScreenDialog(
      {Key key, this.isCenter, this.left, this.top, this.right, this.bottom, this.width, this.height, this.child, this.onTapOutside,
        this.canclable})
      : super(key: key);

  @override
  _FullScreenDialogState createState() => new _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    ctx = context;
    var onDismiss = widget.onTapOutside ?? dismiss;
    return new WillPopScope( //监听实体左上角返回按钮
        onWillPop: () {},
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          body: new Container(
            child: new InkWell(
              onTap: widget.canclable ? onDismiss : () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: new Stack(
                children: widget.isCenter ? <Widget>[
              new Center(
              child: new InkWell(
                child: widget.child,
                onTap: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
              ] : <Widget>[
                  new Positioned(
                    child: new InkWell(
                      child: widget.child,
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    height: widget.height,
                    width: widget.width,
                    bottom: widget.bottom,
                    left: widget.left,
                    right: widget.right,
                    top: widget.top,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  void dismiss() {
    Navigator.of(context).pop();
  }
}

 void dismissDialog() {
   Navigator.of(ctx).pop();
 }