/*
 * @Author: Zww
 * @Date: 2019-08-01 15:51:14
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 09:23:08
 * @Description: 吐司工具类
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastUtil {
  static ToastUtil instance = new ToastUtil();
  static ToastUtil getInstance() {
    return instance;
  }

  void showShortToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(26));
  }

  void showLongToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(26));
  }
}
