import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/goods_detail.dart';

/// Author: ZWW
/// Date: 2019-08-02 17:05
/// Description: 商品详情底部TabBar组件

class DetailPageTabBar extends StatelessWidget {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvide>(
      builder: (context, child, data) {
        return DefaultTabController(
          length: 2,
          child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.pink,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 2.0,
                onTap: (int index) {
                  Provide.value<GoodsDetailProvide>(context)
                      .changeLeftAndRigthStatus(index == 0);
                },
                tabs: <Widget>[
                  Tab(
                    child: Text('详情',
                        style: TextStyle(fontSize: ScreenUtil().setSp(35))),
                  ),
                  Tab(
                    child: Text('评论',
                        style: TextStyle(fontSize: ScreenUtil().setSp(35))),
                  ),
                ],
              )),
        );
      },
    );
  }
}
