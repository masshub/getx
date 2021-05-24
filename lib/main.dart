import 'package:flutter/material.dart';
import 'package:rent/common/constant.dart';
import 'package:rent/demo/lang/translation_service.dart';
import 'package:rent/demo/shared/logger/logger_utils.dart';
import 'package:rent/net/env.dart';
import 'package:rent/net/net/http.dart';
import 'package:rent/plugin/getx/get.dart';
import 'package:rent/routes/app_pages.dart';
import 'package:rent/util/debug_print.dart';
import 'package:rent/util/sp_util.dart';
import 'package:rent/widget/dialog/src/dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Environment environment;

  @override
  void initState() {
    super.initState();
    initConfig();

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: Locale('zh', 'CN'),
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: (context,child) => FlutterSmartDialog(child: child),


    );
  }

  void initConfig() async{
    await SpUtils.init();
    environment = currentEnvironment;
    logD("CurrentEnvironment:$environment");
    Env().init(currentEnvironment);
    Http.init(environment: currentEnvironment);

  }
}

