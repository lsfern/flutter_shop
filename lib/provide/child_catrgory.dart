import 'package:flutter/material.dart';
import '.././model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCateGory = [];

  getChildCateGory(List<BxMallSubDto> list) {
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCateGory = [all];
    childCateGory.addAll(list);
    notifyListeners();
  }
}
