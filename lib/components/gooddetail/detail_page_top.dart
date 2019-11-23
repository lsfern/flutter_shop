import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_shop/provide/goods_detail.dart';
import 'package:provide/provide.dart';
import '../../model/goods_detail.dart';

/// Author: ZWW
/// Date: 2019-08-02 13:58
/// Description: 商品详情顶部组件

class DetailPageTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, child, goodsDetail) {
        GoodInfo goodInfo = Provide.value<GoodsDetailProvide>(context)
            .goodsDetail
            .data
            .goodInfo;
        if (GoodInfo != null) {
          return Container(
            child: Column(
              children: <Widget>[
                _goodsImage(goodInfo.image1),
                _goodsName(goodInfo.goodsName),
                _goodsNum(goodInfo.goodsSerialNumber),
                _goodPrice(goodInfo.presentPrice, goodInfo.oriPrice)
              ],
            ),
          );
        } else {
          return Text('正在加载中...');
        }
      },
    );
  }

  ///商品图片
  Widget _goodsImage(String imageUrl) {
    return Container(
        width: ScreenUtil().setWidth(740),
        margin: EdgeInsets.only(top: 8.0),
        child: FadeInImage.memoryNetwork(
          image: imageUrl,
          placeholder: kTransparentImage,
        ));
  }

  ///商品名称
  Widget _goodsName(String goodsName) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        goodsName,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  ///商品编号
  Widget _goodsNum(String num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text('编号:${num}',
          style:
              TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(27))),
    );
  }

  ///商品价格
  ///@params presentPrice 在售价格
  ///@params truePrice 市场价格
  Widget _goodPrice(double presentPrice, double truePrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
                color: Colors.deepOrange, fontSize: ScreenUtil().setSp(35)),
          ),
          _truePrice(truePrice)
        ],
      ),
    );
  }

  ///商品市场价格
  Widget _truePrice(double truePrice) {
    return Container(
      padding: EdgeInsets.only(left: 30.0),
      child: Row(
        children: <Widget>[
          Text(
            '市场价:',
            style: TextStyle(fontSize: ScreenUtil().setSp(27)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              '￥${truePrice}',
              style: TextStyle(
                  color: Colors.black12,
                  fontSize: ScreenUtil().setSp(27),
                  decoration: TextDecoration.lineThrough),
            ),
          )
        ],
      ),
    );
  }
}
