import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cate_goods.dart';
import '../../provide/goods_detail.dart';
import '../../provide/current_index.dart';

/// Author: ZWW
/// Date: 2019-08-02 18:13
/// Description: 商品底部详情按钮

class DetailPageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide
            .value<GoodsDetailProvide>(context)
            .goodsDetail
            .data
            .goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    int count = 1;
    var price = goodsInfo.presentPrice;
    var image = goodsInfo.image1;
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                Navigator.pop(context);
              },
              child: Stack(
                children: <Widget>[
                  Container(
                      width: ScreenUtil().setWidth(130),
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                        size: 35,
                      )),
                  Provide<CateGoodProvide>(
                    builder: (context, child, val) {
                      String showCount = '${val.allCount}';
                      if (val.allCount > 99) {
                        showCount = '99+';
                      }
                      return Positioned(
                        top: 0,
                        right: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Text(
                            showCount,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(22)),
                          ),
                        ),
                      );
                    },
                  )
                ],
              )),
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
