import 'package:flutter/material.dart';
import 'package:flutter_wechat/net/MyHttpClient.dart';

void httpClient1<T>(BuildContext ctx, successCallback, failCallback) {
  new HttpClient<T>().Get(ctx, '', null, successCallback, failCallback);
}

void httpClient2(BuildContext ctx, successCallback, failCallback) {
  new HttpClient().Get(ctx, '', null, (value) {
    new HttpClient(baseUrl: "http://www.baidu.com").Get(
        ctx, '', null, successCallback, failCallback);
  }, failCallback(),
  );
}