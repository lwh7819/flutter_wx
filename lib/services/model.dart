import 'package:flutter/material.dart';
import 'package:flutter_wechat/net/MyHttpClient.dart';

void httpClient(BuildContext ctx, callback) {
  new HttpClient().Get(ctx, '', null, callback);
}