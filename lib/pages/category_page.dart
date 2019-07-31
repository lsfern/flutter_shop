import 'package:flutter/material.dart';
import '../components/category/left_category.dart';
import '../components/category/right_category.dart';
import '../components/category/mall_goods.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('商品分类'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              LeftCategory(),
              Column(
                children: <Widget>[RightCategory(), MallGoods()],
              )
            ],
          ),
        ));
  }
}
