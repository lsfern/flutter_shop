import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Author: ZWW
/// Date: 2019/8/5 17:23
/// Description: 购物车底部结算组件

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(100),
        color: Colors.white,
        child: Row(
          children: <Widget>[_allCheckBt(), _allPriceArea(), _goButton()],
        ));
  }

  ///全选按钮
  Widget _allCheckBt() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: true,
              activeColor: Colors.pink,
              onChanged: (bool val) {},
            ),
            Text('全选'),
          ],
        ));
  }

  ///合计
  Widget _allPriceArea() {
    return Container(
        width: ScreenUtil().setWidth(420),
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(300),
                  child: Text(
                    '合计:',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36)),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(120),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '￥1992',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(36), color: Colors.red),
                  ),
                )
              ],
            ),
            Container(
              width: ScreenUtil().setWidth(420),
              alignment: Alignment.centerRight,
              child: Text(
                '满10元免配送费，预购免配送费',
                style: TextStyle(
                    color: Colors.black38, fontSize: ScreenUtil().setSp(22)),
              ),
            )
          ],
        ));
  }

  ///结算按钮
  Widget _goButton() {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(70),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算(6)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
