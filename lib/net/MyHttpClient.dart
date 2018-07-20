import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_wechat/utils/DialogUtil.dart';
import 'package:flutter/material.dart';
import 'package:dio/src/Options.dart';
import 'dart:convert';
import 'package:flutter_wechat/utils/SnackBarUtil.dart';
import 'dart:io';

Dio _dio = null;

class HttpClient {
  Map<String, dynamic> headers;
  String baseUrl;
  ContentType contentType;

  HttpClient({
    this.headers,
    this.baseUrl,
    this.contentType})
  {
    if (_dio == null) {
      _dio = new Dio();
    }
    _dio.options.baseUrl = baseUrl == null ? "https://httpbin.org/ip" : baseUrl;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.headers = headers ?? {};
    _dio.options.contentType = contentType ?? null;
  }

  void Get(BuildContext ctx, String path, Map<String, Object> params,
      callback) async {
    _sendRequest(ctx,
      path,
      params,
      callback,
      new Options(method: 'GET'),
    );
  }

  void Post(BuildContext ctx, String path, Map<String, Object> params,
      callback) async {
    _sendRequest(ctx,
      path,
      params,
      callback,
      new Options(method: 'POST'),
    );
  }

  _sendRequest(ctx, path, params, callback, Options options,) async {
//    showLoadingDialog(ctx);
    try {
      print("start-------------------------------------->\nrequest:" + _dio.options.baseUrl + path +
      "\nheader------------------------------------>" + _dio.options.headers.toString());
      Response response = await _dio.request(
          path, data: params, options: options);
//      hideDialog();
      if (response.statusCode == 200) {
        String result = response.data.toString();
        callback(result);
      }
    } on DioError catch (e) {
      showSnackBarWithButton(ctx, '服务器错误', '确定', () {});
//      hideDialog();
      if (e.response != null) {
        print("e.response.data:" + e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print("e.message:" + e.message);
      }
    }
  }

}