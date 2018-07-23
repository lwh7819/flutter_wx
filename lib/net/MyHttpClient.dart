import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/src/Options.dart';
import 'dart:convert';
import 'package:flutter_wechat/utils/SnackBarUtil.dart';
import 'dart:io';

Dio _dio = null;

class HttpClient<T> {
  Map<String, dynamic> headers;
  String baseUrl;
  ContentType contentType;

  HttpClient({
    this.headers,
    this.baseUrl,
    this.contentType}) {
    if (_dio == null) {
      _dio = new Dio();
    }
    _dio.options.baseUrl = baseUrl == null ? "https://httpbin.org/ip" : baseUrl;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.headers = headers ?? {};
    _dio.options.contentType = contentType ?? null;
  }

  Future<Response<T>> Get(BuildContext ctx, String path, Map<String, Object> params,
      successCallback, failCallback) {
    return _sendRequest(ctx,
      path,
      params,
      successCallback,
      failCallback,
      new Options(method: 'GET'),
    );
  }

  Future<Response<T>> Post(BuildContext ctx, String path, Map<String, Object> params,
      successCallback, failCallback) {
    return _sendRequest(ctx,
      path,
      params,
      successCallback,
      failCallback,
      new Options(method: 'POST'),
    );
  }

  Future<Response<T>> _sendRequest(ctx, path, params, successCallback, failCallback, Options options,) {
    print("\nstart--------------------------------------------------------------->"
        "\nrequest:${_dio.options.baseUrl}$path"
        "\nheader:${_dio.options.headers.toString()}");
    Future<Response<T>> future = _dio.request(
        path, data: params, options: options);

    return future.then((response) {
      print("\nsuccess--------------------------------------------------------->");
      if (response.statusCode == 200) {
        String json = JSON.encode(response.data);
        Map map = JSON.decode(json);
        successCallback(map);
      } else {
        failCallback(response.statusCode);
      }
    }, onError: (e) {
      String msg = "未知错误";
      if(e.runtimeType == DioError) {
          switch(e.type) {
            case DioErrorType.DEFAULT:
              msg = "未知错误";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              msg = "请求超时";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              msg = "响应超时";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
            case DioErrorType.RESPONSE:
              msg = "服务器错误";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
            case DioErrorType.CANCEL:
              msg = "链接中断";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
            default:
              msg = "服务器错误";
              showSnackBarWithButton(ctx, msg, '确定', () {});
              break;
          }
      }
      print("\nfail------------------------------------------------------------->");
      if (e.response != null) {
        print("\ne.response.data:${e.response.data}");
        print("\ne.response.headers:${e.response.headers.toString()}");
        print("\ne.response.request:${e.response.request.toString()}");
        print("\ne.message:${e.message}");
      } else {
        print("\ne.message:${e.message}");
      }

      failCallback(msg);
    });
  }

}