import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent/util/debug_print.dart';
import 'package:rent/widget/dialog/src/self_dialog.dart';
import 'package:rent/widget/dialog/src/smart_dialog.dart';

///
/// @author: maker
/// @date: 2021/5/21 14:53
/// description:
/// 


class LoadingInterceptor extends Interceptor {
  bool isLoading = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //打开加载弹窗
    if (isLoading) {
      SmartDialog.showLoading( //遮罩颜色
        maskColorTemp: Colors.black.withOpacity(0.35),
        //loading背景色
        background: Colors.black.withOpacity(0.9),);
    }
    log("打开加载弹窗:$isLoading");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //关闭弹窗
    if (isLoading && SelfDialog.isExist()) SelfDialog.dismiss();
    log("关闭弹窗");
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    //关闭弹窗
    log("关闭弹窗");
    if (isLoading && SelfDialog.isExist()) SelfDialog.dismiss();
    handler.next(err);
  }
}

