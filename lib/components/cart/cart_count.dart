

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Author: ZWW
/// Date: 2019/8/6 10:05
/// Description: 购物车加减数量组件

class CartCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 10.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black12)),
      child: Row(
        children: <Widget>[_reduceNum(), _num(), _addNum()],
      ),
    );
  }

  ///数量减少
  Widget _reduceNum() {
    return Container(
      width: ScreenUtil().setWidth(45),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(width: 1.0, color: Colors.black12))),
      child: Text('-'),
    );
  }

  ///数量增加
  Widget _addNum() {
    return Container(
      width: ScreenUtil().setWidth(45),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1.0, color: Colors.black12))),
      child: Text('+'),
    );
  }

  ///数量
  Widget _num() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('4'),
    );
  }
}
