import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/cate_goods.dart';
import '../components/cart/cart_item.dart';
import '../components/cart/cart_bottom.dart';

/// Author: ZWW
/// Date: 2019/7/24 10:34
/// Description: 购物车界面

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _getCateInfo(context),
          builder: (context, data) {
            if (data.hasData) {
              return Provide<CateGoodProvide>(
                builder: (context, child, childCateInfo) {
                  List cartList = childCateInfo.cateInfo;
                  if (cartList.isNotEmpty) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 55),
                          child: Provide<CateGoodProvide>(
                            builder: (context, child, childCateInfo) {
                              return ListView.builder(
                                itemCount: cartList.length,
                                itemBuilder: (context, index) {
                                  return CartItem(cartList[index]);
                                },
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: CartBottom(),
                        )
                      ],
                    );
                  } else {
                    /// TODO: 替换无数据或数据加载失败样式或弹框
                    return Center(
                      child: Text('暂无数据...')
                    );
                  }
                },
              );
            } else {
              return Center(
                  child: Text('加载中...')
              );
            }
          },
        ));
  }

  Future<String> _getCateInfo(BuildContext context) async {
    await Provide.value<CateGoodProvide>(context).getCateInfo();
    return 'end';
  }
}
