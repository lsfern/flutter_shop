import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../provide/category_list.dart';
import '../../provide/child_catrgory.dart';
import '../../provide/left_category.dart';

/// Author: ZWW
/// Date: 2019/8/1 15:02
/// Description: 分类界面类别组件

class LeftCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<LeftCategoryProvide>(
      builder: (context, child, leftCategory) {
        List leftCategoryList = leftCategory.leftCategoryList;
        return Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(right: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            itemCount: leftCategoryList.length,
            itemBuilder: (context, index) {
              return _leftCategoryItem(context, leftCategoryList, index);
            },
          ),
        );
      },
    );
  }

  Widget _leftCategoryItem(
      BuildContext context, List leftCategoryList, int index) {
    int clickIndex = Provide.value<LeftCategoryProvide>(context).clickIndex;
    bool isClick = false;
    isClick = (clickIndex == index);
    return InkWell(
      onTap: () {
        var childList = leftCategoryList[index].bxMallSubDto;
        var categoryId = leftCategoryList[index].mallCategoryId;

        /// 设置大类别点击Index
        Provide.value<LeftCategoryProvide>(context)
            .changeClickIndex(categoryId);

        /// 获取子类类别
        Provide.value<ChildCategory>(context)
            .getChildCateGory(childList, categoryId);

        /// 获取指定项的全部商品
        Provide.value<CategoryListProvide>(context)
            .getMallGoods(categoryId, '');
      },
      child: Container(
        height: ScreenUtil().setHeight(90),
        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: BoxDecoration(
            color: isClick ? Colors.black12 : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          leftCategoryList[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
