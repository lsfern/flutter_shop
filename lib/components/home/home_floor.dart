/*
 * @Author: Zww
 * @Date: 2019-07-30 15:21:18
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 09:01:24
 * @Description: 楼层组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class FloorWidget extends StatelessWidget {
  final String floorTitle;
  final List floorGoodList;

  FloorWidget({Key key, this.floorTitle, this.floorGoodList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _floorTitle(),
          _firstRow(context),
          _otherGoods(context),
        ],
      ),
    );
  }

  //楼层标题
  Widget _floorTitle() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(floorTitle),
    );
  }

  Widget _firstRow(BuildContext context) {
    return Row(
      children: <Widget>[
        _floorItem(context, floorGoodList[0]),
        Column(
          children: <Widget>[
            _floorItem(context, floorGoodList[1]),
            _floorItem(context, floorGoodList[2])
          ],
        )
      ],
    );
  }

  Widget _otherGoods(BuildContext context) {
    return Row(
      children: <Widget>[
        _floorItem(context, floorGoodList[3]),
        _floorItem(context, floorGoodList[4]),
      ],
    );
  }

  //子项布局
  Widget _floorItem(BuildContext context, Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Applcation.router
              .navigateTo(context, '/detail?id=${goods['goodsId']}');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
