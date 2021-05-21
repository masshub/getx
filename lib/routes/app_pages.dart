import 'package:rent/app.dart';
import 'package:rent/page/home/home.dart';
import 'package:rent/page/login/login.dart';
import 'package:rent/page/mine/mine.dart';
import 'package:rent/page/splash/splash.dart';
import 'package:rent/plugin/getx/get.dart';

part 'app_routes.dart';
///
/// @author: maker
/// @date: 2021/5/20 10:06
/// description:
/// 

class AppPages{

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => Splash(),
        children: [
          GetPage(
            name: Routes.LOGIN,
            page: () => Login(),
            children: [
              GetPage(
                name: Routes.APP,
                page: () => App(),
              ),
            ],
          ),
          GetPage(
            name: Routes.APP,
            page: () => App(),
          ),
        ]),
  ];




}

