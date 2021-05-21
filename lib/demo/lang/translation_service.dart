import 'package:flutter/material.dart';
import 'package:rent/demo/lang/zh_CN.dart';
import 'package:rent/plugin/getx/get.dart';

import 'en_us.dart';
import 'pt_br.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
        'pt_BR': pt_BR,
      };
}
