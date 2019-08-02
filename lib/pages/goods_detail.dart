import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/goods_detail.dart';
import './detailpage/detail_page_top.dart';
import './detailpage/detail_page_tip.dart';
import './detailpage/detail_page_tabbar.dart';
import './detailpage/detail_page_web.dart';
import './detailpage/detail_page_bottom.dart';

class GoodsDetailPage extends StatelessWidget {
  final String goodsId;
  GoodsDetailPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('商品详情页'),
        ),
        body: FutureBuilder(
          future: _getGoodsDetail(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      DetailPageTop(),
                      DetailPageTip(),
                      DetailPageTabBar(),
                      DetailPageWeb(),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: DetailPageBottom(),
                  ),
                ],
              );
            } else {
              return Text('加载中........');
            }
          },
        ));
  }

  Future _getGoodsDetail(BuildContext context) async {
    await Provide.value<GoodsDetailProvide>(context).getGoodDetail(goodsId);
    return '加载完成';
  }
}
