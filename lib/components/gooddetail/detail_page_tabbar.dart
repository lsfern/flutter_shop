import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail.dart';

/// Author: ZWW
/// Date: 2019-08-02 17:05
/// Description: 商品详情底部TabBar组件

class DetailPageTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, child, data) {
        bool isLeft = data.isLeft;
        bool isRight = data.isRight;
        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              _leftTabBar(context, isLeft),
              _rightTabBar(context, isRight)
            ],
          ),
        );
      },
    );
  }

  ///详情TabBar
  ///@param context 上下文对象
  ///@param isClickLeft 是否点击详情
  Widget _leftTabBar(BuildContext context, bool isLeft) {
    return InkWell(
        onTap: () {
          Provide.value<GoodsDetailProvide>(context)
              .changeLeftAndRigthStatus(true);
        },
        child: Container(
          width: ScreenUtil().setWidth(375),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1.5, color: isLeft ? Colors.pink : Colors.black12))),
          child: Text('详情',
              style: TextStyle(
                  color: isLeft ? Colors.pink : Colors.black,
                  fontSize: ScreenUtil().setSp(35))),
        ));
  }

  ///评论TabBar
  Widget _rightTabBar(BuildContext context, bool isRight) {
    return InkWell(
        onTap: () {
          Provide.value<GoodsDetailProvide>(context)
              .changeLeftAndRigthStatus(false);
        },
        child: Container(
          width: ScreenUtil().setWidth(375),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1.5,
                      color: isRight ? Colors.pink : Colors.black12))),
          child: Text('评论',
              style: TextStyle(
                  color: isRight ? Colors.pink : Colors.black,
                  fontSize: ScreenUtil().setSp(35))),
        ));
  }
}
