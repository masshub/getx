import 'package:dio/dio.dart';
import 'dart:async';

import 'package:rent/util/debug_print.dart';


///
/// @author: maker
/// @date: 2021/5/17 10:33
/// description:
/// 
class TokenInterceptor extends InterceptorsWrapper{
  late String? _token;


  @override
   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
        // await initClient(_token);
      }
    }
    options.headers["Authorization"] = _token;
    handler.next(options);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        // await SPUtils.save(Constant.TOKEN_KEY, _token);
      }
    } catch (e) {
      logD(e);
    }
    handler.next(response);
  }


  ///获取授权token
  getAuthorization() async {
    // String token = await SPUtils.get(Constant.TOKEN_KEY);
    // ignore: unnecessary_null_comparison
    // if (token == null) {
      // String basic = await SPUtils.get(Constant.USER_BASIC_CODE);
      // ignore: unnecessary_null_comparison
      // if (basic == null) {
        // 跳转至登录页,提示输入账号密码
      // } else {
        //通过 basic 去获取token，获取到设置，返回token
        // return "Basic $basic";
      // }
    // } else {
      // this._token = token;
      // return token;
    // }
  }


  ///清除授权
  clearAuthorization() {
    this._token = null;
    // SPUtils.remove(Constant.TOKEN_KEY);
    // releaseClient();
  }







}


