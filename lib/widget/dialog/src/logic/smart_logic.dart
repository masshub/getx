import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rent/widget/dialog/src/widget/smart_dialog_view.dart';

import 'config.dart';

class SmartLogic {
  ///SmartLogic相关配置,使用Config管理
  late Config config;

  ///该控件是全局覆盖在app页面上的控件,该库dialog便是基于此实现;
  ///用户也可以用此控件自定义相关操作
  late OverlayEntry overlayEntry;

  ///Toast之类应该是和Dialog之类区分开,且能独立存在,提供备用覆盖浮层
  late OverlayEntry overlayEntryExtra;

  ///提供全局单例
  static SmartLogic get instance => _getInstance();

  ///-------------------------私有类型，不对面提供修改----------------------
  ///呈现的Widget
  Widget? _widget;
  Widget? _widgetExtra;
  GlobalKey<SmartDialogViewState>? _key;
  GlobalKey<SmartDialogViewState>? _keyExtra;
  Completer? _completer;
  Completer? _completerExtra;
  static SmartLogic? _instance;
  VoidCallback? _onDismiss;
  VoidCallback? _onExtraDismiss;
  List _toastList = [];

  static SmartLogic _getInstance() {
    if (_instance == null) {
      _instance = SmartLogic._internal();
    }
    return _instance!;
  }

  SmartLogic._internal() {
    ///初始化一些参数

    ///主体覆盖浮层
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return SmartLogic.instance._widget ?? Container();
      },
    );

    ///备用覆盖浮层
    overlayEntryExtra = OverlayEntry(
      builder: (BuildContext context) {
        return SmartLogic.instance._widgetExtra ?? Container();
      },
    );

    config = Config();
  }

  Future<void> show({
    required Widget widget,
    AlignmentGeometry? alignment,
    bool? isPenetrate,
    bool? isUseAnimation,
    Duration? animationDuration,
    bool? isLoading,
    Color? maskColor,
    bool? clickBgDismiss,
    bool isUseExtraWidget = false,
    VoidCallback? onDismiss,
    VoidCallback? onExtraDismiss,
  }) async {
    //处理下事件监听
    _onDismiss = onDismiss;
    _onExtraDismiss = onExtraDismiss;

    //展示弹窗
    var globalKey = GlobalKey<SmartDialogViewState>();
    Widget smartDialogView = SmartDialogView(
      key: globalKey,
      alignment: alignment ?? instance.config.alignment,
      isPenetrate: isPenetrate ?? instance.config.isPenetrate,
      isUseAnimation: isUseAnimation ?? instance.config.isUseAnimation,
      animationDuration:
          animationDuration ?? instance.config.animationDuration,
      isLoading: isLoading ?? instance.config.isLoading,
      maskColor: maskColor ?? instance.config.maskColor,
      clickBgDismiss: clickBgDismiss ?? instance.config.clickBgDismiss,
      child: widget,
      onBgTap: () => dismiss(closeType: !isUseExtraWidget ? 0 : 1),
    );

    if (!isUseExtraWidget) {
      _widget = smartDialogView;
      config.isExist = true;
      _key = globalKey;
      _rebuild(buildType: 0);
      _completer = Completer();
      return _completer!.future;
    } else {
      _widgetExtra = smartDialogView;
      config.isExistExtra = true;
      _keyExtra = globalKey;
      _rebuild(buildType: 1);
      _completerExtra = Completer();
      return _completerExtra!.future;
    }
  }

  ///提供toast示例
  Future<void> showToast({
    Duration time = const Duration(milliseconds: 1500),
    alignment: Alignment.bottomCenter,
    required Widget widget,
    //默认消失类型,类似android的toast,toast一个一个展示
    //非默认消失类型,多次点击,后面toast会顶掉前者的toast显示
    bool isDefaultDismissType = true,
  }) async {
    //处理默认类型逻辑
    if (isDefaultDismissType) {
      while (true) {
        if (_toastList.length == 0) {
          break;
        }
        await Future.delayed(Duration(milliseconds: 100));
      }
    }

    //通用逻辑
    _toastList.add(
      instance.show(
        widget: widget,
        isPenetrate: true,
        clickBgDismiss: false,
        isUseExtraWidget: true,
      ),
    );
    await Future.delayed(time);
    if (_toastList.length == 1) {
      await dismiss(closeType: 1);
    }
    _toastList.removeLast();
  }

  ///关闭Dialog
  ///
  /// closeType：关闭类型；0：仅关闭主体OverlayEntry、1：仅关闭额外OverlayEntry、2：俩者都关闭
  ///
  /// 如果不清楚使用,请查看showToast和showLoading
  static Future<void> dismiss({int closeType = 0}) async {
    return instance._dismiss(closeType: closeType);
  }

  Future<void> _dismiss({int closeType = 0}) async {
    if (closeType == 0) {
      await _dismissBody();
    } else if (closeType == 1) {
      await _dismissExtra();
    } else if (closeType == 2) {
      await _dismissBody();
      await _dismissExtra();
    }

    _rebuild(buildType: closeType);
  }

  Future<void> _dismissBody() async {
    _widget = null;
    config.isExist = false;
    if (_onDismiss != null) {
      _onDismiss!();
    }

    var state = _key?.currentState;
    await state?.dismiss();

    if (!(_completer?.isCompleted ?? true)) {
      _completer!.complete();
    }
  }

  Future<void> _dismissExtra() async {
    _widgetExtra = null;
    config.isExistExtra = false;
    if (_onExtraDismiss != null) {
      _onExtraDismiss!();
    }

    var stateExtra = _keyExtra?.currentState;
    await stateExtra?.dismiss();
    if (!(_completerExtra?.isCompleted ?? true)) {
      _completerExtra!.complete();
    }
  }

  ///刷新重建，实际上是调用OverlayEntry中builder方法,重建布局
  ///
  /// buildType：刷新类型；0：仅刷新主体Overlay、1：仅刷新额外Overlay、2：俩者都刷新
  void _rebuild({int? buildType}) {
    if (buildType == 0) {
      overlayEntry.markNeedsBuild();
    } else if (buildType == 1) {
      overlayEntryExtra.markNeedsBuild();
    } else if (buildType == 2) {
      overlayEntry.markNeedsBuild();
      overlayEntryExtra.markNeedsBuild();
    }
  }
}
