/*
 * @Author: Zww
 * @Date: 2019-07-30 10:28:10
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-30 11:06:59
 * @Description: 首页导航组件
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridItemViewUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(
            item['mallCategoryName'],
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.navigatorList.length > 10) {
      navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
        height: ScreenUtil().setHeight(320),
        padding: const EdgeInsets.all(3.0),
        margin: const EdgeInsets.only(
            top: 10.0, left: 0.0, bottom: 0.0, right: 0.0),
        child: GridView.count(
            padding: const EdgeInsets.all(4.0),
            crossAxisCount: 5,
            children: navigatorList.map((item) {
              return _gridItemViewUI(context, item);
            }).toList()));
  }
}
