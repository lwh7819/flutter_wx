import 'package:flutter/material.dart';
import 'view/LoadingDialog.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'net/MyHttpClient.dart';
import 'utils/PopUtil.dart';

class XkTabBar extends StatelessWidget {
  var ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return new WillPopScope( //监听实体左上角返回按钮
        onWillPop: () {Navigator.of(context).pop();},
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(''),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.add, color: Colors.white,),
                  onPressed: _httpClient),
            ],
          ),
          body: new Container(
              alignment: Alignment.bottomCenter,
              child: new Text('')
          ),
        )
    );
  }

  void _httpClient() async {
    PopUtil.showLoadingDialog(ctx);
//    new HttpClient().funGet('', null,
//            (value) {
//          print("lwhh" + value);
//        }
//    );
    new Timer(new Duration(milliseconds: 3000), (){PopUtil.dismissLoadingDialog();});
  }
}