/*
 * @Author: Zww
 * @Date: 2019-07-31 14:16:59
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-31 18:48:44
 * @Description: 分类界面类别组件
 */
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../service/server_method.dart';
import '../../provide/child_catrgory.dart';
import '../../provide/category_list.dart';
import '../../model/category.dart';
import '../../model/category_goods.dart';

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
        Provide.value<ChildCategory>(context).getChildCateGory(childList);
        _getMallGoodsList(categoryId);
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
      Provide.value<ChildCategory>(context)
          .getChildCateGory(leftCategoryList[0].bxMallSubDto);
      _getMallGoodsList(leftCategoryList[0].mallCategoryId);
    });
  }

  void _getMallGoodsList(String categoryId) async {
    var formData = {'categoryId': categoryId, 'categorySubId': '', 'page': 1};
    await sendRequest('getMallGoods', formData: formData).then((val) {
      var data = json.decode(val.toString());
      CategoryGoods categoryGoods = CategoryGoods.fromJson(data);
      Provide.value<CategoryListProvide>(context)
          .getCategoryList(categoryGoods.data);
    });
  }
}
