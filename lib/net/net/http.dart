import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rent/common/config.dart';
import 'package:rent/net/contents_type.dart';
import 'package:rent/net/env.dart';
import 'package:rent/net/interceptor/interceptor_error.dart';
import 'package:rent/net/interceptor/interceptor_loading.dart';
import 'package:rent/net/interceptor/interceptor_response.dart';
import 'package:rent/net/net/http_method.dart';
import 'package:rent/net/oauth_type.dart';

import 'net_util.dart';

///举例：搞定
testHttp() async {
  //处理一些初始化设置，必须
  Http.init();

  // 内数据源是实体
  var query = {'cid': '60'};
  var result = await Http.get(
    'https://www.wanandroid.com/article/list/0/json',
    queryParameters: query,
  );

  // var bean = NetObjectBean().fromJson(result);
  // showToast(bean.datas[0].title);
  // Toolkit.Log.i(result);

  ///--------------------------------------------------------------

  //内数据源是列表
  var resultList = await Http.get(
    'https://www.wanandroid.com/banner/json',
    // 'https://api.ixiaowai.cn/api/api.php?return=json',
  );

  // var list = (resultList as List).map((e) {
  //   return NetListBean().fromJson(e);
  // }).toList();
  // showToast(list[0].title);
  // Toolkit.Log.i(resultList);
}

class Http {
  static LoadingInterceptor loadingInterceptor = LoadingInterceptor();
  static ErrorInterceptor errorInterceptor = ErrorInterceptor();
  static ResponseInterceptor responseInterceptor = ResponseInterceptor();

  static void init({
    Environment? environment,
    String? baseUrl,
    int? connectTimeout,
    int? sendTimeout,
    int? receiveTimeout,
    List<Interceptor>? interceptors,
  }) {
    NetUtil.instance.init(
      baseUrl: baseUrl,
      environment: environment,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      interceptors: interceptors,
    );

    //处理通用的实体
    NetUtil.instance.addInterceptor(responseInterceptor);
    //处理全局loading
    NetUtil.instance.addInterceptor(loadingInterceptor);

    NetUtil.instance.addInterceptor(errorInterceptor);
  }

  ///Get请求
  static Future get(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isLoading = true,
    bool isShowError = true,
    OauthType oauthType = OauthType.token,
    ContentsType contentType = ContentsType.json,
  }) async {
    var response = await request(
      path,
      method: HttpMethod.get,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      isLoading: isLoading,
      isShowError: isShowError,
      oauthType: oauthType,
      contentType: contentType,
    );
    return response;
  }

  ///Post请求
  static Future post(String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool isLoading = true,
    bool isShowError = true,
    OauthType oauthType = OauthType.token,
    ContentsType contentType = ContentsType.json,
  }) async {
    var response = await request(
      path,
      method: HttpMethod.post,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      isLoading: isLoading,
      oauthType: oauthType,
      contentType: contentType,
    );
    return response;
  }

  /// Request 操作
  /// Put、Delete请求之类都请使用Request请求
  ///
  /// 所有类型请求,都是调用此请求
  static Future request(String path, {
    HttpMethod method = HttpMethod.get,
    data,
    bool isLoading = true,
    bool isShowError = true,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    OauthType oauthType = OauthType.token,
    ContentsType contentType = ContentsType.json,
  }) async {
    loadingInterceptor.isLoading = isLoading;
    errorInterceptor.isShowError = Config.DEBUG;
    responseInterceptor.isShowError = isShowError;

    var response = await NetUtil.instance.request(
      path,
      method: method,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  ///设置请求头
  static void setHeaders(Map<String, dynamic> map) {
    NetUtil.instance.setHeaders(map);
  }

  ///设置取消token
  static void cancelRequests({CancelToken? token}) {
    NetUtil.instance.cancelRequests(token: token);
  }
}


