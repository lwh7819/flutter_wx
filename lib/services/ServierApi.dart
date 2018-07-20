import 'package:flutter/material.dart';
import 'package:flutter_wechat/net/MyHttpClient1.dart';

void httpClient1<T>(BuildContext ctx, successCallback, failCallback) {
  new HttpClient1<T>().Get(ctx, '', null, successCallback, failCallback);
}

void httpClient2(BuildContext ctx, successCallback, failCallback) {
  new HttpClient1().Get(ctx, '', null, (value) {
    new HttpClient1(baseUrl: "http://www.baidu.com").Get(
        ctx, '', null, successCallback, failCallback);
  }, failCallback(),
  );
}