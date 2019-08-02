/*
 * @Author: Zww
 * @Date: 2019-08-02 17:52:37
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 18:09:56
 * @Description: 商品详情和评论Html组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail.dart';

class DetailPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, chid, goodData) {
        print(goodData.goodsDetail.data.goodInfo.goodsDetail);
        if (goodData.isLeft) {
          return Container(
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
