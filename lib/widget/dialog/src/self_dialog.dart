import 'package:flutter/material.dart';

import 'flutter_smart_dialog.dart';

///
/// @author: maker
/// @date: 2021/5/21 15:14
/// description:
/// 
class SelfDialog {
  SelfDialog.init() {
    SmartDialog.instance.config
      ..clickBgDismiss = true
      ..isLoading = true
      ..isUseAnimation = true
      ..animationDuration = Duration(milliseconds: 270)
      ..isPenetrate = false
      ..maskColor = Colors.black.withOpacity(0.3)
      ..isExist = false
      ..isExistExtra = false
      ..alignment = Alignment.center;
  }

  static Future<void> show({
    required Widget widget,
    AlignmentGeometry? alignmentTemp,
    bool? isPenetrateTemp,
    bool? isUseAnimationTemp,
    Duration? animationDurationTemp,
    bool? isLoadingTemp,
    Color? maskColorTemp,
    bool? clickBgDismissTemp,
    bool isUseExtraWidget = false,
  }) {
    return SmartDialog.show(
      widget: widget,
      alignmentTemp: alignmentTemp,
      isPenetrateTemp: isPenetrateTemp,
      isUseAnimationTemp: isUseAnimationTemp,
      animationDurationTemp: animationDurationTemp,
      isLoadingTemp: isLoadingTemp,
      maskColorTemp: maskColorTemp,
      clickBgDismissTemp: clickBgDismissTemp,
      isUseExtraWidget: isUseExtraWidget,
    );
  }

  static Future<void> showLoading() {
    return SmartDialog.showLoading();
  }

  static Future<void> showToast(
      String msg, {
        Duration time = const Duration(milliseconds: 1500),
        alignment: Alignment.bottomCenter,
      }) async {
    return SmartDialog.showToast(msg, time: time, alignment: alignment);
  }

  static Future<void> dismiss({int closeType = 0}) async {
    return SmartDialog.dismiss(closeType: closeType);
  }

  static bool isExist() {
    return SmartDialog.instance.config.isExist;
  }

  static bool isExistExtra() {
    return SmartDialog.instance.config.isExistExtra;
  }
}



