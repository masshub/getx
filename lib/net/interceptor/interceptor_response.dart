import 'package:dio/dio.dart';
import 'package:rent/util/debug_print.dart';

import '../code.dart';
import '../result_data.dart';

///
/// @author: maker
/// @date: 2021/5/17 14:17
/// description:
///

class ResponseInterceptor extends InterceptorsWrapper {
  bool isShowError = true;

  @override
  void onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    RequestOptions option = response.requestOptions;

    log("response:::${response.statusCode}");
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if ((header != null && header.toString().contains("text"))) {
        value = ResultData(response.data, true, Code.SUCCESS);
      } else if (response.statusCode! >= 200 && response.statusCode! < 300) {
        value = ResultData(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      log(e.toString() + option.path);
      value = ResultData(response.data, false, response.statusCode!,
          headers: response.headers);
    }

    ///  //处理最外层数据结构
    //     // BaseResponse bean = BaseResponse.fromJson(response.data);
    //
    //     //可以在此处处理一些通用的错误信息
    //     // if(bean.errorCode == 1) {
    //     //   /// to implement your logic
    //     // }
    //     // response.data = bean.data;

      if(isShowError){

      }

    handler.next(response);
  }
}
