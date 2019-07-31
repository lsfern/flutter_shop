/*
 * @Author: Zww
 * @Date: 2019-07-31 16:25:58
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-31 18:44:29
 * @Description: 商品列表
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/category_list.dart';
class MallGoods extends StatefulWidget {
  @override
  _MallGoodsState createState() => _MallGoodsState();
}

class _MallGoodsState extends State<MallGoods> {
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryListProvide>(
      builder: (context, child, data) {
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(1000),
          child: ListView.builder(
            itemCount: data.categoryList.length,
            itemBuilder: (context, index) {
              return _listItemWidget(data.categoryList,index);
            },
          ),
        );
      },
    );
  }

  Widget _goodsImage(List newList,int index) {
    return Container(
      width: ScreenUtil().setHeight(170),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodName(List newList,int index) {
    return Container(
      width: ScreenUtil().setWidth(400),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodPrice(List newList,int index) {
    return Container(
      width: ScreenUtil().setWidth(400),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Text("价格：￥${newList[index].presentPrice}",
              style: TextStyle(
                  color: Colors.pink, fontSize: ScreenUtil().setSp(30))),
          Text("${newList[index].oriPrice}",
              style: TextStyle(
                  color: Colors.black12,
                  fontSize: ScreenUtil().setSp(28),
                  decoration: TextDecoration.lineThrough)),
        ],
      ),
    );
  }

  Widget _listItemWidget(List newList,int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(newList,index),
            Column(
              children: <Widget>[_goodName(newList,index), _goodPrice(newList,index)],
            )
          ],
        ),
      ),
    );
  }
}
