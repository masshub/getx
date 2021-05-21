import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rent/common/config.dart';
import 'package:rent/util/debug_print.dart';

///
/// @author: maker
/// @date: 2021/5/17 14:10
/// description:
///
class LogsInterceptor extends InterceptorsWrapper {
  static List<Map> sHttpResponses = [];
  static List<String> sResponsesHttpUrl = [];

  static List<Map<String, dynamic>> sHttpRequest = [];
  static List<String> sRequestHttpUrl = [];

  static List<Map<String, dynamic>> sHttpError = [];
  static List<String> sHttpErrorUrl = [];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("请求url：${options.path} ${options.method}");
    log('请求头: ' + options.headers.toString());
    if (options.data != null) {
      log('请求参数: ' + options.data.toString());
    }
    try {
      addLogic(sRequestHttpUrl, options.path);
      var data;
      if (options.data is Map) {
        data = options.data;
      } else {
        data = Map<String, dynamic>();
      }
      var map = {
        "header:": {...options.headers},
      };
      if (options.method == "POST") {
        map["data"] = data;
      }
      addLogic(sHttpRequest, map);
    } catch (e) {
      log(e);
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    log('返回参数: ' + response.toString());

    if (response.data is Map || response.data is List) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, data);
      } catch (e) {
        log(e);
      }
    } else if (response.data is String) {
      try {
        var data = Map<String, dynamic>();
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, data);
      } catch (e) {
        log(e);
      }
    } else if (response.data != null) {
      try {
        String data = response.data.toJson();
        addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, json.decode(data));
      } catch (e) {
        log(e);
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (Config.DEBUG) {
      log('请求异常: ' + err.toString());
      log('请求异常信息: ' + (err.response.toString()));
    }
    try {
      addLogic(sHttpErrorUrl, err.requestOptions.path);
      var errors = Map<String, dynamic>();
      errors["error"] = err.message;
      addLogic(sHttpError, errors);
    } catch (e) {
      log(e);
    }
    handler.next(err);
  }

  static addLogic(List? list, data) {
    if (list != null) {
      if (list.length > 20) {
        list.removeAt(0);
      }
      list.add(data);
    }
  }
}
