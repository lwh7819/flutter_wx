import 'package:flutter/material.dart';

/**
 * 平移动画路由的封装
 */
class RouterUtil {
  /**
   * 入栈
   */
  static Function NavigatorPush(BuildContext context, mWidget){
    return () {
      Navigator.of(context).push(
          new PageRouteBuilder(
              pageBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return mWidget;
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,) {
                // 添加一个平移动画
                return createTransition(animation, child);
              }));
    };
  }

  /**
   * 出栈
   */
  static Function NavigatorPop<T>(BuildContext context, T result) {
    return () {
      Navigator.pop(context, result);
    };
  }

  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}