import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cate_goods.dart';
import '../../provide/goods_detail.dart';

/// Author: ZWW
/// Date: 2019-08-02 18:13
/// Description: 商品底部详情按钮

class DetailPageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<GoodsDetailProvide>(context).goodsDetail.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    int count = 0;
    var price = goodsInfo.presentPrice;
    var image = goodsInfo.image1;
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
            onTap: () {
              Provide.value<CateGoodProvide>(context)
                  .save(goodsId, goodsName, count, price, image);
            },
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
            onTap: () {
              Provide.value<CateGoodProvide>(context).remove();
            },
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
