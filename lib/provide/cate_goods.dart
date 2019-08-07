import 'package:flutter/material.dart';
import 'dart:convert';

import '../model/cate_info.dart';
import '../utils/shared_preference.dart';

/// Author: ZWW
/// Date: 2019/8/5 10:17
/// Description: Shopping cart provide

class CateGoodProvide with ChangeNotifier {
  /// 购物车本地存储Key值
  final String spGoodsInfo = 'cateInfo';

  /// 商品ID为空抛出的异常信息
  final String goodsIdNullException = 'GOODSID IS NOT ALLOW NULL';

  /// 购物车列表
  List cateInfo = [];

  /// 本地存储的购物车数据
  String cateInfoString = '[]';

  /// 商品总价
  double allPrice = 0;

  /// 商品总数量
  int allCount = 0;

  /// 是否全部选中
  bool isAllCheck = true;

  /// Add CateInfoModel
  ///
  /// Throw an exception [goodsIdNullException] if [goodsId] is null
  /// [goodsName].
  /// [count].
  /// [price].
  /// [image].
  save(String goodsId, goodsName, count, price, image) async {
    if (goodsId == null || goodsId.isEmpty) throw goodsIdNullException;
    SpUtil spUtil = await _setSpCateInfo();
    var temp =
        cateInfoString == null ? [] : json.decode(cateInfoString.toString());
    List<Map> cateInfoList = (temp as List).cast();
    bool isHave = false;
    int index = 0;
    allPrice = 0;
    allCount = 0;
    cateInfoList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        cateInfoList[index]['count'] = item['count'] + 1;
        isHave = true;
      }
      if (item['isCheck']) {
        allPrice += (cateInfoList[index]['price'] * cateInfoList[index]['count']);
        allCount += cateInfoList[index]['count'];
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
      allPrice += count * price;
      allCount += count;
    }
    cateInfoString = json.encode(cateInfoList).toString();
    await spUtil.setString(cateInfoString);
    notifyListeners();
  }

  /// Get CateInfo
  getCateInfo() async {
    await _setSpCateInfo();
    cateInfo = [];
    if (cateInfoString == null) {
      cateInfo = [];
    } else {
      List<Map> mapCateInfo =
          (json.decode(cateInfoString.toString()) as List).cast();
      allPrice = 0;
      allCount = 0;
      isAllCheck = true;
      mapCateInfo.forEach((item) {
        if (item['isCheck']) {
          allPrice += (item['count'] * item['price']);
          allCount += item['count'];
        } else {
          isAllCheck = false;
        }
        cateInfo.add(new CateInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  /// Delete goods by [goodsId]
  ///
  /// Throw an exception [goodsIdNullException] if [goodsId] is null
  deleteGoodsByGoodsId(String goodsId) async {
    if (goodsId == null || goodsId.isEmpty) throw goodsIdNullException;
    SpUtil spUtil = await _setSpCateInfo();
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
    await getCateInfo();
  }

  /// Change item check status by [cateInfoModel]
  changeItemCheckStatus(CateInfoModel cateInfoModel) async {
    SpUtil spUtil = await _setSpCateInfo();
    List<Map> tempList = (json.decode(cateInfoString) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    for (var item in tempList) {
      if (item['goodsId'] == cateInfoModel.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    }
    tempList[changeIndex] = cateInfoModel.toJson();
    cateInfoString = json.encode(tempList).toString();
    spUtil.setString(cateInfoString);
    await getCateInfo();
  }

  /// Change all item check status by [isCheck]
  changeAllItemCheckStatus(bool isCheck) async {
    SpUtil spUtil = await _setSpCateInfo();
    List<Map> tempList = (json.decode(cateInfoString) as List).cast();
    List<Map> newList = [];
    for (var item in tempList) {
      var newItem = item;
      item['isCheck'] = isCheck;
      newList.add(newItem);
    }
    cateInfoString = json.encode(newList).toString();
    spUtil.setString(cateInfoString);
    await getCateInfo();
  }

  /// Update shop count by [cartItem] and [todo]
  shopCountAddOrReduceAction(CateInfoModel cartItem, String todo) async {
    SpUtil spUtil = await _setSpCateInfo();
    List<Map> tempList = (json.decode(cateInfoString) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if (todo == 'add') {
      cartItem.count++;
    } else {
      cartItem.count--;
    }
    tempList[changeIndex] = cartItem.toJson();
    cateInfoString = json.encode(tempList).toString();
    spUtil.setString(cateInfoString);
    await getCateInfo();
  }

  /// Set [cateInfoString] by [SpUtil.getString()]
  ///
  /// return [SpUtil]
  Future<SpUtil> _setSpCateInfo() async {
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    cateInfoString = spUtil.getString();
    return spUtil;
  }

  remove() async {
    SpUtil spUtil = await SpUtil.getInstance(spGoodsInfo);
    spUtil.remove();
    cateInfo = [];
  }
}
