import 'package:dio/dio.dart';

/// 网络配置
class NetConfig {
  /// 禁用实例化HttpConfig类
  NetConfig._();

  /// 是否启用代理 代理服务IP 代理服务端口
  static bool proxyEnable = false;
  static String proxyIp = '';
  static String proxyPort = '';

  /// 超时时间 30s
  static const int connectTimeout = 30000;

  /// 发送超时时间 30s
  static const int sendTimeout = 30000;

  /// 接收超时时间 30s
  static const int receiveTimeout = 30000;

  /// 请求内容类型 form，UTF-8
  static const String contentTypeForm = 'application/x-www-form-urlencoded';
  static const String contentTypeJson = 'application/json; charset=utf-8';
  static const String contentTypeText = 'text/plain';
  static const String headerContentType = "content-type";
  static const String authorization = "authorization";

  /// 是否启用缓存  缓存的最长时间，单位（秒）  最大缓存数
  // static const cacheEnable = true;
  // static const cacheMaxAge = 1000;
  // static const cacheMaxCount = 100;










}
