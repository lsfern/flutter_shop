import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cate_goods.dart';

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
        child: Provide<CateGoodProvide>(
          builder: (context, child, val) {
            return Row(
              children: <Widget>[
                _allCheckBt(context),
                _allPriceArea(context),
                _goButton(context)
              ],
            );
          },
        ));
  }

  ///全选按钮
  Widget _allCheckBt(BuildContext context) {
    CateGoodProvide cateGoodProvide = Provide.value<CateGoodProvide>(context);
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Checkbox(
              value: cateGoodProvide.isAllCheck,
              activeColor: Colors.pink,
              onChanged: (bool val) {
                cateGoodProvide.changeAllItemCheckStatus(val);
              },
            ),
            Text('全选'),
          ],
        ));
  }

  ///合计
  Widget _allPriceArea(BuildContext context) {
    double allPrice = Provide.value<CateGoodProvide>(context).allPrice;
    return Container(
        width: ScreenUtil().setWidth(420),
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '合计:',
                      style: TextStyle(fontSize: ScreenUtil().setSp(36)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(left: 7.0),
                  child: Text(
                    '￥$allPrice',
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
  Widget _goButton(BuildContext context) {
    int allCount = Provide.value<CateGoodProvide>(context).allCount;
    String showCount = '结算($allCount)';
    if (allCount > 99) {
      showCount = '结算(99+)';
    }
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(70),
        padding: EdgeInsets.only(left: 10.0, right: 5.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
            child: Text(
              showCount,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
