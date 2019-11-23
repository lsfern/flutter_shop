import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import '../pages/goods_detail.dart';

Handler goodDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsId = params['id'].first;
  print('index>page>GoodsDetailPage goodsID is ${goodsId}');
  return GoodsDetailPage(goodsId);
});
