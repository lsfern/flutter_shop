/*
 * @Author: Zww
 * @Date: 2019-07-31 16:25:58
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-01 18:28:12
 * @Description: 商品列表
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/child_catrgory.dart';
import 'package:provide/provide.dart';
import '../../provide/category_list.dart';
import '../../routers/application.dart';
class MallGoods extends StatefulWidget {
  @override
  _MallGoodsState createState() => _MallGoodsState();
}

class _MallGoodsState extends State<MallGoods> {
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  var scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryListProvide>(
      builder: (context, child, data) {
        try {
          if (Provide.value<ChildCategory>(context).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch (e) {}
        if (data.categoryList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                refreshFooter: ClassicsFooter(
                  key: _footerKey,
                  loadText: '上拉加载',
                  loadReadyText: '正在加载...',
                  loadingText: '正在加载...',
                  noMoreText: Provide.value<ChildCategory>(context).noMoreText,
                  loadedText: '加载成功',
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.pink,
                  showMore: false,
                  moreInfo: '加载中',
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: data.categoryList.length,
                  itemBuilder: (context, index) {
                    return _listItemWidget(data.categoryList, index);
                  },
                ),
                loadMore: () async {
                  Provide.value<CategoryListProvide>(context)
                      .getMoreMallGoods(context);
                },
              ),
            ),
          );
        } else {
          return Text('暂无数据');
        }
      },
    );
  }

  Widget _goodsImage(List newList, int index) {
    return Container(
      width: ScreenUtil().setHeight(170),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodName(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(400),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodPrice(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(400),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Text("价格：￥${newList[index].presentPrice}",
              style: TextStyle(
                  color: Colors.pink, fontSize: ScreenUtil().setSp(30))),
          Text("${newList[index].oriPrice}",
              style: TextStyle(
                  color: Colors.black12,
                  fontSize: ScreenUtil().setSp(28),
                  decoration: TextDecoration.lineThrough)),
        ],
      ),
    );
  }

  Widget _listItemWidget(List newList, int index) {
    return InkWell(
      onTap: () {
        Applcation.router.navigateTo(context, '/detail?id=${newList[index].goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Expanded(
              child: Column(
                children: <Widget>[
                  _goodName(newList, index),
                  _goodPrice(newList, index)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
