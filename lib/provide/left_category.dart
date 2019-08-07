import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import '../service/server_method.dart';
import '../provide/child_catrgory.dart';
import '../provide/category_list.dart';
import '../model/category.dart';

/// Author: ZWW
/// Date: 2019/8/7 16:48
/// Description: 分类界面大类别状态管理

class LeftCategoryProvide with ChangeNotifier {
  /// 分类大类别
  List leftCategoryList = [];

  /// 大类别选中Index
  int clickIndex = 0;

  /// 获取分类大类别数据
  getLeftCategory(BuildContext context) async {
    var val = await sendRequest('getCategory');
    var data = json.decode(val.toString());
    CategoryModel categoryModel = CategoryModel.fromJson(data);
    leftCategoryList = categoryModel.data;

    /// 获取第一项的二级类别
    Provide.value<ChildCategory>(context)
        .getChildCateGory(leftCategoryList[0].bxMallSubDto, '');

    /// 获取第一项的全部商品
    Provide.value<CategoryListProvide>(context)
        .getMallGoods(leftCategoryList[0].mallCategoryId, '');

    notifyListeners();
  }

  /// 改变大类别Index
  changeClickIndex(String mallCategoryId) {
    int tempIndex = 0;
    int changeIndex = 0;
    leftCategoryList.forEach((item) {
      if (item.mallCategoryId == mallCategoryId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    clickIndex = changeIndex;
    notifyListeners();
  }
}
