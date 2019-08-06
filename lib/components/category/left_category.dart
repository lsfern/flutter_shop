import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../model/category.dart';
import '../../provide/category_list.dart';
import '../../provide/child_catrgory.dart';
import '../../service/server_method.dart';

/// Author: ZWW
/// Date: 2019/8/1 15:02
/// Description: 分类界面类别组件

class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {
  List leftCategoryList = [];
  int clickIndex = 0;
  @override
  void initState() {
    _getLeftCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: leftCategoryList.length,
        itemBuilder: (context, index) {
          return _leftCategoryItem(index);
        },
      ),
    );
  }

  Widget _leftCategoryItem(int index) {
    bool isClick = false;
    isClick = (clickIndex == index);
    return InkWell(
      onTap: () {
        setState(() {
          clickIndex = index;
        });
        var childList = leftCategoryList[index].bxMallSubDto;
        var categoryId = leftCategoryList[index].mallCategoryId;
        Provide.value<ChildCategory>(context)
            .getChildCateGory(childList, categoryId);
        //获取指定项的全部商品
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

  void _getLeftCategory() async {
    await sendRequest('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      setState(() {
        leftCategoryList = categoryModel.data;
      });
      //获取第一项的二级类别
      Provide.value<ChildCategory>(context)
          .getChildCateGory(leftCategoryList[0].bxMallSubDto, '');

      //获取第一项的全部商品
      Provide.value<CategoryListProvide>(context)
          .getMallGoods(leftCategoryList[0].mallCategoryId, '');

    });
  }
}
