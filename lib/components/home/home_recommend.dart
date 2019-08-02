/*
 * @Author: Zww
 * @Date: 2019-07-30 13:57:44
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 08:59:07
 * @Description: 推荐商品组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
class HomeRecommend extends StatelessWidget {
  final List recommendList;

  HomeRecommend({Key key, this.recommendList}) : super(key: key);

  //推荐商品标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //推荐商品列表布局
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(context,index);
        },
      ),
    );
  }

  //推荐商品列表子项布局
  Widget _item(BuildContext context,int index) {
    return InkWell(
      onTap: () {
        Applcation.router.navigateTo(context, '/detail?id=${recommendList[index]['goodsId']}');
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width:1, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommendList()],
      ),
    );
  }
}
