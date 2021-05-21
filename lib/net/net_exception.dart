import 'package:dio/dio.dart';

///
/// @author: maker
/// @date: 2021/5/21 14:40
/// description:
/// 

class NetException implements Exception {
  final String? message;
  final int? code;

  NetException(this.code, this.message);

  String toString() => "$code$message";

  factory NetException.init(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return NetException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return NetException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return NetException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return NetException(-1, "响应超时");
      case DioErrorType.response:
        try {
          int errCode = error.response?.statusCode ?? -1;
          switch (errCode) {
            case 400:
              return NetException(errCode, "请求语法错误");
            case 401:
              return NetException(errCode, "没有权限");
            case 403:
              return NetException(errCode, "服务器拒绝执行");
            case 404:
              return NetException(errCode, "无法连接服务器");
            case 405:
              return NetException(errCode, "请求方法被禁止");
            case 500:
              return NetException(errCode, "服务器内部错误");
            case 502:
              return NetException(errCode, "无效的请求");
            case 503:
              return NetException(errCode, "服务器挂了");
            case 505:
              return NetException(errCode, "不支持HTTP协议请求");
            default:
              return NetException(
                  errCode, error.response?.statusMessage ?? '未知错误');
          }
        } catch (e) {
          return NetException(-1, "未知错误：${e.toString()}");
        }
      default:
        return NetException(-1, error.message);
    }
  }
}

