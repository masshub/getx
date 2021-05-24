import 'package:rent/common/config.dart';

///
/// @author: maker
/// @date: 2021/5/21 14:43
/// description:
///

Future<void> logD(Object? object) async{
  if (Config.DEBUG) {
    print(object);
  }
}
