import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// @author: maker
/// @date: 2021/5/20 16:50
/// description:
///
///

class Toasts {
  static void show(
    String msg, {
    Toast? toastLength,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        fontSize: fontSize,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }

  static void showCenter(
    String msg, {
    Toast? toastLength,
    double? fontSize,
    Color? backgroundColor,
    Color? textColor,
  }) {
    show(msg,
        toastLength: toastLength,
        fontSize: fontSize,
        gravity: ToastGravity.CENTER,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }

  static void showTop(
    String msg, {
    Toast? toastLength,
    double? fontSize,
    Color? backgroundColor,
    Color? textColor,
  }) {
    show(msg,
        toastLength: toastLength,
        fontSize: fontSize,
        gravity: ToastGravity.TOP,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }

  static void showBottom(
    String msg, {
    Toast? toastLength,
    double? fontSize,
    Color? backgroundColor,
    Color? textColor,
  }) {
    show(msg,
        toastLength: toastLength,
        fontSize: fontSize,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: backgroundColor,
        textColor: textColor);
  }
}
