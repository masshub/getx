import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:rent/common/config.dart';
import 'package:rent/net/net_exception.dart';
import 'package:rent/util/debug_print.dart';

///
/// @author: maker
/// @date: 2021/5/17 11:20
/// description:
///

class ErrorInterceptor extends InterceptorsWrapper {

  bool isShowError = true;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // 没有网络
      if(isShowError){

      }

    } else if (connectivityResult == ConnectivityResult.mobile) {
      // 移动网络
      if(isShowError){

      }

    } else if (connectivityResult == ConnectivityResult.wifi) {
      // wifi
      if(isShowError){

      }

    }
    handler.next(options);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // error统一处理
    NetException netException = NetException.init(err);
    // 错误提示
    logD('DioError===: ${netException.toString()}');
    if(isShowError){

    }

    err.error = netException;
    handler.next(err);
  }
}
