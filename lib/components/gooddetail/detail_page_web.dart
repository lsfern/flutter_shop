import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail.dart';

/// Author: ZWW
/// Date: 2019-08-02 17:52
/// Description: 商品详情web界面

class DetailPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, child, goodData) {
        print(goodData.goodsDetail.data.goodInfo.goodsDetail);
        if (goodData.isLeft) {
          return Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(90)),
            child: Html(
              data: goodData.goodsDetail.data.goodInfo.goodsDetail,
            ),
          );
        } else {
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('暂无数据'));
        }
      },
    );
  }
}
