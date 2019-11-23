import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/left_category.dart';
import '../provide/category_list.dart';
import '../provide/child_catrgory.dart';
import '../model/category.dart';
import '../components/category/left_category.dart';
import '../components/category/right_category.dart';
import '../components/category/mall_goods.dart';

/// Author: ZWW
/// Date: 2019/7/24 10:12
/// Description: 分类界面

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
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _getLeftCategory(context),
          builder: (context, categoryData) {
            print(categoryData);
            if (categoryData.hasData) {
              return Provide<LeftCategoryProvide>(
                  builder: (context, child, leftCateData) {
                List leftCategoryList = leftCateData.leftCategoryList;
                if (leftCategoryList.isNotEmpty) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        LeftCategory(),
                        Column(
                          children: <Widget>[RightCategory(), MallGoods()],
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('暂无数据...'));
                }
              });
            } else {
              return Center(child: Text('加载中...'));
            }
          },
        ));
  }

  Future _getLeftCategory(BuildContext context) async {
    await Provide.value<LeftCategoryProvide>(context).getLeftCategory(context);
    return 'end';
  }
}
