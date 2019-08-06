import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import './cart_count.dart';
import 'package:provide/provide.dart';
import '../../provide/cate_goods.dart';
import '../../model/cate_info.dart';

/// Author: ZWW
/// Date: 2019-08-05 16:23
/// Description: 购物车列表组件

class CartItem extends StatelessWidget {
  final CateInfoModel cateInfoModel;
  CartItem(this.cateInfoModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _goodsCheckBt(context,cateInfoModel),
          _goodsImage(),
          _goodsName(),
          _goodsPrice(context,cateInfoModel)
        ],
      ),
    );
  }

  ///商品多选按钮
  Widget _goodsCheckBt(context,item) {
    return Container(
      child: InkWell(
          onTap: () {},
          child: Checkbox(
            value: item.isCheck,
            activeColor: Colors.pink,
            onChanged: (bool val) {},
          )),
    );
  }

  ///商品图片
  Widget _goodsImage() {
    return Container(
        width: ScreenUtil().setWidth(150),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
        ),
        child: FadeInImage.memoryNetwork(
          image: cateInfoModel.images,
          placeholder: kTransparentImage,
        ));
  }

  ///商品名称
  Widget _goodsName() {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(cateInfoModel.goodsName),
          CartCount()
        ],
      ),
    );
  }

  ///商品价格
  Widget _goodsPrice(BuildContext context,item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: InkWell(
              onTap: () {
                Provide.value<CateGoodProvide>(context).deleteGoodsByGoodsId(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
