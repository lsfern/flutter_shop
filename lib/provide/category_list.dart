import 'package:flutter/material.dart';
import '../model/category_goods.dart';

class CategoryListProvide with ChangeNotifier {
  List<CategoryListData> categoryList = [];
  getCategoryList(List list) {
    categoryList = list;
    notifyListeners();
  }
}
