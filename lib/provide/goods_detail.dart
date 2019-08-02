import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/server_method.dart';
import '../model/goods_detail.dart';

class GoodsDetailProvide with ChangeNotifier {
  GoodsDetail goodsDetail;
  bool isLeft = true;
  bool isRight = false;

  ///获取商品详情
  ///@params id 商品ID
  getGoodDetail(String id) async {
    var formData = {'goodId': id};
    var responseData =
        await sendRequest('getGoodDetailById', formData: formData);
    var result = json.decode(responseData.toString());
    goodsDetail = GoodsDetail.fromJson(result);
    notifyListeners();
  }

  ///改变点击状态
  ///@params icClickLeft 是否点击详情
  changeLeftAndRigthStatus(bool isClickLeft) {
    isLeft = isClickLeft;
    isRight = !isClickLeft;
    notifyListeners();
  }
}
