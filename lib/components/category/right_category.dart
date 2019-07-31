/*
 * @Author: Zww
 * @Date: 2019-07-31 15:05:55
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-31 18:46:20
 * @Description: 子类别组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/child_catrgory.dart';
import '../../model/category.dart';

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
              return _rightCategoryItem(childCategory.childCateGory[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightCategoryItem(BxMallSubDto bxMallSubDto) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 10.0),
        child: Text(
          bxMallSubDto.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
