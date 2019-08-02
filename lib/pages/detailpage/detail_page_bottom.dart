/*
 * @Author: Zww
 * @Date: 2019-08-02 18:13:48
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 18:31:03
 * @Description: 商品详情底部按钮
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {},
              child: Container(
                  width: ScreenUtil().setWidth(130),
                  padding: EdgeInsets.only(left: 15.0),
                  child: Icon(Icons.shopping_cart))),
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(310),
              height: ScreenUtil().setHeight(90),
              color: Colors.green,
              alignment: Alignment.center,
              child: Text('加入购物车',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28))),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(310),
              height: ScreenUtil().setHeight(90),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('立即购买',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28))),
            ),
          )
        ],
      ),
    );
  }
}
