import 'dart:collection';

import 'package:rent/net/contents_type.dart';
import 'package:rent/net/env.dart';
import 'package:rent/net/method_type.dart';
import 'package:rent/net/oauth_type.dart';
import 'package:rent/plugin/getx/get.dart';
import 'package:rent/plugin/getx/get_connect/http/src/exceptions/exceptions.dart';

///
/// @author: maker
/// @date: 2021/5/20 12:11
/// description:
///

class HttpManager {
  late GetConnect httpManager;

  HttpManager() {
    httpManager = GetConnect();
    httpManager.timeout = Duration(seconds: 30);
  }

  Future<Response<T>> netFetch<T>(
    String url, {
    MethodType methodType = MethodType.get,
    ContentsType? contentTypes,
    OauthType oauthType = OauthType.token,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
    bool hasTip = false,
  }) async {
    if (headers == null) {
      headers = HashMap();
    }
    // headers['application'] = "app_rent";
    // headers['versionCode'] = "164";

    if (oauthType == OauthType.token) {
      headers['authorization'] = await Env().oauthToken;
    } else if (oauthType == OauthType.basic) {
      headers['authorization'] = Env().basicAuth;
    }

    String? contentTypeStr;
    if (contentTypes == ContentsType.json) {
      contentTypeStr = "application/json; charset=utf-8";
    } else if (contentTypes == ContentsType.form) {
      contentTypeStr = "application/x-www-form-urlencoded";
    } else if (contentTypes == ContentsType.text) {
      contentTypeStr = "text/plain";
    }

    Response<T> response = Response();
    try {
      response = await httpManager.request<T>(
        url,
        methodType.toString(),
        contentType: contentTypeStr,
        headers: headers,
        body: params,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
    } on GetHttpException catch (e) {
      print(e.toString());
    }

    return response;
  }
}

final HttpManager httpManager = new HttpManager();
