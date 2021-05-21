import 'dart:convert';

import 'package:rent/page/mine/user_center.dart';

///
/// @author: maker
/// @date: 2021/5/18 16:05
/// description:
///

enum Environment {
  /// 开发
  dev,

  /// 联调主
  unite1,

  /// 联调次
  unite2,

  /// 测试主
  test1,

  /// 测试次
  test2,

  /// 准生产
  preProduction,

  /// 预生产
  productionCo,

  /// 生产
  production,
}

class Env {
  late Environment environment;
  late String clientId;
  late String clientSecret;
  late String authHost;
  late String apiHost;
  late String h5TruckerHost;
  late String h5Double11Host;
  late String basicAuth;
  late String oauthToken;

  Env();

  init(Environment env) async{
    this.environment = env;
    clientId = clientId;
    clientSecret = clientSecret;
    authHost = authHosts;
    apiHost = apiHosts;
    h5TruckerHost = h5TruckerHosts;
    h5Double11Host = h5Double11Hosts;
    basicAuth = basicAuths;
    oauthToken = await oauthTokens;

    toString();

  }


  @override
  String toString() {
    return 'Env{environment: $environment, clientId: $clientId, clientSecret: $clientSecret, authHost: $authHost, apiHost: $apiHost, h5TruckerHost: $h5TruckerHost, h5Double11Host: $h5Double11Host, basicAuth: $basicAuth, oauthToken: $oauthToken}';
  }

  /// clientId
  String get clientIds {
    return 'TRUCKER';
  }

  /// clientSecret
  String get clientSecrets {
    String _clientSecret;
    switch (this.environment) {
      case Environment.production:
        _clientSecret = '645c8a929e6c412c9febf90b2ad07374';
        break;
      case Environment.productionCo:
        _clientSecret = '645c8a929e6c412c9febf90b2ad07374';
        break;
      default:
        _clientSecret = 'b8a5d79fdffc7766c64735288beb064b';
        break;
    }
    return _clientSecret;
  }

  /// 认证服务器
  String get authHosts {
    String _authHost;
    switch (this.environment) {
      case Environment.unite1:
        _authHost = 'http://auth.zhilun-integration-major.com';
        break;
      case Environment.unite2:
        _authHost = 'http://auth.zhilun-integration-minor.com';
        break;
      case Environment.test1:
        _authHost = 'http://auth.zhilun-qa-major.com';
        break;
      case Environment.test2:
        _authHost = 'http://auth.zhilun-qa-minor.com';
        break;
      case Environment.preProduction:
        _authHost = 'https://auth-t.zhilunkeji.com';
        break;
      case Environment.productionCo:
        _authHost = 'https://auth.zhilun.co';
        break;
      case Environment.production:
        _authHost = 'https://auth.zhilunkeji.com';
        break;
      default:
        _authHost = 'https://auth-t.zhilunkeji.com';
        break;
    }
    return _authHost;
  }

  /// 接口服务器
  String get apiHosts {
    String _apiHost;
    switch (this.environment) {
      case Environment.unite1:
        _apiHost = 'http://apin.zhilun-integration-major.com';
        break;
      case Environment.unite2:
        _apiHost = 'http://apin.zhilun-integration-minor.com';
        break;
      case Environment.test1:
        _apiHost = 'http://apin.zhilun-qa-major.com';
        break;
      case Environment.test2:
        _apiHost = 'http://apin.zhilun-qa-minor.com';
        break;
      case Environment.preProduction:
        _apiHost = 'https://apin-t.zhilunkeji.com';
        break;
      case Environment.productionCo:
        _apiHost = 'https://apin.zhilun.co';
        break;
      case Environment.production:
        _apiHost = 'https://apin.zhilunkeji.com';
        break;
      default:
        _apiHost = 'https://apin-t.zhilunkeji.com';
        break;
    }
    return _apiHost;
  }

  /// h5 trucker host
  String get h5TruckerHosts {
    String _h5TruckerHost;
    switch (this.environment) {
      case Environment.unite1:
        _h5TruckerHost = 'http://trucker.zhilun-integration-major.com';
        break;
      case Environment.unite2:
        _h5TruckerHost = 'http://trucker.zhilun-integration-minor.com';
        break;
      case Environment.test1:
        _h5TruckerHost = 'http://trucker.zhilun-qa-major.com';
        break;
      case Environment.test2:
        _h5TruckerHost = 'http://trucker.zhilun-qa-minor.com';
        break;
      case Environment.preProduction:
        _h5TruckerHost = 'https://suit-t.zhilun.com';
        break;
      case Environment.productionCo:
        _h5TruckerHost = 'https://suit.zhilun.co';
        break;
      case Environment.production:
        _h5TruckerHost = 'https://suit.zhilun.com';
        break;
      default:
        _h5TruckerHost = 'https://suit.zhilun.com';
        break;
    }
    return _h5TruckerHost;
  }

  /// h5 double11 host
  String get h5Double11Hosts {
    String _h5Double11Host;
    switch (this.environment) {
      case Environment.unite2:
        _h5Double11Host = 'http://h5.zhilun-integration-minor.com/activity';
        break;
      case Environment.test2:
        _h5Double11Host = 'http://h5.zhilun-qa-minor.com/activity';
        break;
      case Environment.preProduction:
        _h5Double11Host = 'https://sh-t.zhilun.com/activity';
        break;
      case Environment.productionCo:
        _h5Double11Host = 'https://suit.zhilun.co';
        break;
      case Environment.production:
        _h5Double11Host = 'https://sh.zhilun.com/activity';
        break;
      default:
        _h5Double11Host = 'https://sh.zhilun.com/activity';
        break;
    }
    return _h5Double11Host;
  }

  String get basicAuths {
    return "Basic ${base64Encode(utf8.encode("$clientId:$clientSecret"))}";
  }

  Future<String> get oauthTokens async {
    String tokenType = await UserCenter.tokenType;
    String accessToken = await UserCenter.accessToken;
    return "$tokenType $accessToken";
  }
}
