/*
 * @Author: Zww
 * @Date: 2019-07-30 15:21:18
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-30 15:35:43
 * @Description: 楼层组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          _firstRow(),
          _otherGoods(),
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

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _floorItem(floorGoodList[0]),
        Column(
          children: <Widget>[
            _floorItem(floorGoodList[1]),
            _floorItem(floorGoodList[2])
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _floorItem(floorGoodList[3]),
        _floorItem(floorGoodList[4]),
      ],
    );
  }

  //子项布局
  Widget _floorItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层${goods['image']}');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
