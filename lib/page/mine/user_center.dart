

import 'package:rent/util/sp_util.dart';

///
/// @author: maker
/// @date: 2021/5/19 10:47
/// description: 用户中心
///
class UserCenter {
  static Future<String> get tokenType async {
    return await SpUtils.get("token_type") ?? "";
  }

  static Future<String> get accessToken async {
    return await SpUtils.get("access_token") ?? "";
  }

  static Future<String> get refreshToken async {
    return await SpUtils.get("refreshToken") ?? "";
  }

  static Future<String> get userIdStr async {
    return await SpUtils.get("userId");
  }

  static Future<num> get userIdNum async {
    return int.parse(await SpUtils.get("userId"));
  }

  static Future<String> get userType async {
    return await SpUtils.get("userType");
  }

  static Future<String> get userName async {
    return await SpUtils.get("telephone");
  }

  static Future<String> get telePhone async {
    return await SpUtils.get("telephone");
  }
}
