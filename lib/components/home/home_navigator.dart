import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../provide/category_list.dart';
import '../../provide/child_catrgory.dart';
import '../../provide/current_index.dart';
import '../../provide/left_category.dart';

/// Author: ZWW
/// Date: 2019-07-30 10:28
/// Description: 首页导航组件

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  Widget _gridItemViewUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        /// 改变当前大类选中状态
        Provide.value<LeftCategoryProvide>(context)
            .changeClickIndex(item.mallCategoryId);

        /// 获取当前大类的二级类别
        Provide.value<ChildCategory>(context)
            .getChildCateGory(item.bxMallSubDto, '');

        /// 获取当前大类的全部商品
        Provide.value<CategoryListProvide>(context)
            .getMallGoods(item.mallCategoryId, '');

        /// 设置底部Tab下标，显示分类界面
        Provide.value<CurrentIndexProvide>(context).changeIndex(1);
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          Text(
            item.mallCategoryName,
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      ),
    );
  }
}
