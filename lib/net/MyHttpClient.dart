import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio/src/Options.dart';

Dio _dio = null;

class HttpClient {
  HttpClient() {
    if (_dio == null) {
      _dio = new Dio();
    }
    _dio.options.baseUrl = "https://httpbin.org/ip";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
  }

  void funGet(String path, Map<String, Object> params, callback) async{
    Response response = await _dio.get(path, data: params);
    String result = response.data.toString();
    callback(result);
  }

  void funPost(String path, Map<String, Object> params) async {
     await _dio.post(path, data: params);
  }

  Future<Response> funPostForm(String path, FormData params) async {
    Future<Response> response = null;
    try {
      response= (await _dio.post(path, data: params)) as Future<Response>;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
      }
    }
    return response;
  }
}