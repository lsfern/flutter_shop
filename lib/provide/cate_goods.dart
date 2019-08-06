import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/cate_info.dart';
import '../utils/shared_preference.dart';

/// Author: ZWW
/// Date: 2019/8/5 10:17
/// Description: Shopping cart provide

class CateGoodProvide with ChangeNotifier {
  final String spGoodsInfo = 'cateInfo';
  final String goodsIdNullException = 'GOODSID IS NOT ALLOW NULL';
  List cateInfo = [];

  String cateInfoString = '[]';

  /// Add CateInfoModel
  ///
  /// Throw an exception [goodsIdNullException] if [goodsId] is null
  /// [goodsName].
  /// [count].
  /// [price].
  /// [image].
  save(String goodsId, goodsName, count, price, image) async {
    if (goodsId == null || goodsId.isEmpty) throw goodsIdNullException;
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    cateInfoString = spUtil.getString();
    var temp =
        cateInfoString == null ? [] : json.decode(cateInfoString.toString());
    List<Map> cateInfoList = (temp as List).cast();
    bool isHave = false;
    int index = 0;
    cateInfoList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        cateInfoList[index]['count'] = item['count'] + 1;
        cateInfoList[index]['count']++;
        isHave = true;
      }
      index++;
    });

    if (!isHave) {
      Map<String, dynamic> mapData = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': image,
        'isCheck': true
      };
      cateInfoList.add(mapData);
      cateInfo.add(new CateInfoModel.fromJson(mapData));
    }
    cateInfoString = json.encode(cateInfoList).toString();
    await spUtil.setString(cateInfoString);
    notifyListeners();
  }

  remove() async {
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    spUtil.remove();
    cateInfo = [];
  }

  /// Get CateInfo
  getCateInfo() async {
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    cateInfoString = spUtil.getString();
    cateInfo = [];
    if (cateInfoString == null) {
      cateInfo = [];
    } else {
      List<Map> mapCateInfo =
          (json.decode(cateInfoString.toString()) as List).cast();
      mapCateInfo.forEach((item) {
        cateInfo.add(new CateInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  /// Delete goods
  ///
  /// Throw an exception [goodsIdNullException] if [goodsId] is null
  deleteGoodsByGoodsId(String goodsId) async {
    if (goodsId == null || goodsId.isEmpty) throw goodsIdNullException;
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    cateInfoString = spUtil.getString();
    List<Map> _cateInfoList = (json.decode(cateInfoString) as List).cast();
    int chooseIndex = -1;
    int forIndex = 0;
    _cateInfoList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        chooseIndex = forIndex;
      }
      forIndex++;
    });
    _cateInfoList.removeAt(chooseIndex);
    cateInfoString = json.encode(_cateInfoList).toString();
    spUtil.setString(cateInfoString);
    getCateInfo();
  }
}
