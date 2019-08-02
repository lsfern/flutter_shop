import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import './child_catrgory.dart';
import '../service/server_method.dart';
import '../model/category_goods.dart';
import '../utils/flutter_toast.dart';

class CategoryListProvide with ChangeNotifier {
  List<CategoryListData> categoryList = [];

  ///获取商品列表
  ///@param categoryId 类别ID
  ///@param categorySubId 二级类别ID
  getMallGoods(String categoryId, String categorySubId) async {
    var formData = {
      'categoryId': categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    await sendRequest('getMallGoods', formData: formData).then((val) {
      var data = json.decode(val.toString());
      CategoryGoods categoryGoods = CategoryGoods.fromJson(data);
      List<CategoryListData> _categoryList = categoryGoods.data;
      categoryList = _categoryList != null ? _categoryList : [];
    });
    notifyListeners();
  }

  ///上拉加载获取商品列表
  getMoreMallGoods(BuildContext context) async {
    ChildCategory childCategoryProvide = Provide.value<ChildCategory>(context);
    childCategoryProvide.changePage();
    var formData = {
      'categoryId': childCategoryProvide.categoryId,
      'categorySubId': childCategoryProvide.subId,
      'page': childCategoryProvide.page
    };
    await sendRequest('getMallGoods', formData: formData).then((val) {
      var data = json.decode(val.toString());
      CategoryGoods categoryGoods = CategoryGoods.fromJson(data);
      List<CategoryListData> _categoryList = categoryGoods.data;
      if (_categoryList != null) {
        categoryList.addAll(_categoryList);
      } else {
        childCategoryProvide.changeNoMoreText('没有更多数据了');
        ToastUtil.getInstance().showShortToast('已经到底了');
      }
    });
    notifyListeners();
  }
}
