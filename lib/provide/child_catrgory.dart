import 'package:flutter/material.dart';
import '.././model/category.dart';

/// Author: ZWW
/// Date: 2019/7/30 13:27
/// Description: 商品二级类别Provide

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCateGory = [];
  String categoryId = '4';
  String subId = '';
  int page = 1;
  String noMoreText = '';
  int childIndex = 0;

  ///获取子类类别
  ///@params list 类别列表
  getChildCateGory(List<BxMallSubDto> list, String id) {
    childIndex = 0;
    categoryId = id;
    page = 1;
    noMoreText = '';
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCateGory = [all];
    childCateGory.addAll(list);
    notifyListeners();
  }

  ///改变子类选中下标
  ///@param index
  changeChildIndex(int index, String id) {
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  ///改变分页page
  changePage() {
    page++;
  }

  ///改变底部加载提示
  ///@param text 加载提示
  changeNoMoreText(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
