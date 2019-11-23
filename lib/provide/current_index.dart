import 'package:flutter/material.dart';

/// Author: ZWW
/// Date: 2019/8/7 13:38
/// Description: 底部tab状态管理

class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
