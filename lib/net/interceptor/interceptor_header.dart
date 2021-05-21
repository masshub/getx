import 'package:dio/dio.dart';
import 'package:rent/common/constant.dart';

///
/// @author: maker
/// @date: 2021/5/17 14:03
/// description:
/// 
class HeaderInterceptor extends InterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = Constant.CONNECT_TIMEOUT;
    options.receiveTimeout = Constant.RECEIVE_TIMEOUT;
    handler.next(options);
  }

}

