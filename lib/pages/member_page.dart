import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

/// Author: ZWW
/// Date: 2019/7/24 17:20
/// Description: 个人中心界面

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            _topHead(),
            _myOrder(),
            _orderDetail(),
            _actionList()
          ],
        ));
  }

  Widget _topHead() {
    return Container(
        width: ScreenUtil().setWidth(750),
        color: Colors.pinkAccent,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: ClipOval(
                child: SizedBox(
                  width: 130.0,
                  height: 130.0,
                  child: Image.network(
                    "http://s2.sinaimg.cn/mw690/001oL5ijgy6NOL5BmQV71&690",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                '技术宅',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(36), color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget _myOrder() {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: ListTile(
        leading: Icon(
          Icons.list,
          color: Colors.pink,
          size: 30,
        ),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderDetail() {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 20.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  color: Colors.pink,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('待付款'),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  color: Colors.pink,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('待发货'),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  color: Colors.pink,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('待收货'),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  color: Colors.pink,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('待评价'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myListTile(String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          _myListTile('客服电话'),
          _myListTile('关于我们'),
        ],
      ),
    );
  }
}
