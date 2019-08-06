import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/child_catrgory.dart';
import '../../provide/category_list.dart';
import '../../model/category.dart';

/// Author: ZWW
/// Date: 2019-07-31 15:05
/// Description: 二级类别组件

class RightCategory extends StatefulWidget {
  @override
  _RightCategoryState createState() => _RightCategoryState();
}

class _RightCategoryState extends State<RightCategory> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCateGory.length,
            itemBuilder: (context, index) {
              return _rightCategoryItem(
                  index, childCategory.childCateGory[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightCategoryItem(int index, BxMallSubDto bxMallSubDto) {
    bool isClick = false;
    ChildCategory childCategoryProvide = Provide.value<ChildCategory>(context);
    isClick = (index == childCategoryProvide.childIndex);
    return InkWell(
      onTap: () {
        //设置当前二级类别项
        childCategoryProvide.changeChildIndex(index,bxMallSubDto.mallSubId);
        //获取当前类别ID
        String categoryId = childCategoryProvide.categoryId;
        //获取商品列表
        Provide.value<CategoryListProvide>(context)
            .getMallGoods(categoryId, bxMallSubDto.mallSubId);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 10.0),
        child: Text(
          bxMallSubDto.mallSubName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.pink : Colors.black),
        ),
      ),
    );
  }
}
