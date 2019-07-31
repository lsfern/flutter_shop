/*
 * @Author: Zww
 * @Date: 2019-07-30 10:28:10
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-30 17:21:37
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
        height: ScreenUtil().setHeight(265),
        padding: const EdgeInsets.all(3.0),
        margin: const EdgeInsets.only(
          top: 10.0,
        ),
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(4.0),
            crossAxisCount: 5,
            children: navigatorList.map((item) {
              return _gridItemViewUI(context, item);
            }).toList()));
  }
}