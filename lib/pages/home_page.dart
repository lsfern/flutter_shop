import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import '../service/server_method.dart';

import '../components/home/home_swiperdiy.dart';
import '../components/home/home_navigator.dart';
import '../components/home/home_adbanner.dart';
import '../components/home/home_leader_phone.dart';
import '../components/home/home_recommend.dart';
import '../components/home/home_floor.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int page = 1;
  List hotGoodsList = [];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  ///保持页面状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: sendRequest('homePageContent', formData: formData),
          builder: (context, result) {
            if (result.hasData) {
              var data = json.decode(result.data.toString());
              var _data = data['data'];
              if (_data != null) {
                List<Map> swiperList = (_data['slides'] as List).cast();
                List<Map> navigatorList = (_data['category'] as List).cast(); //
                String advertesPicture =
                    _data['advertesPicture']['PICTURE_ADDRESS']; //广告图
                String leaderImage = _data['shopInfo']['leaderImage']; //店长图片
                String leaderPhone = _data['shopInfo']['leaderPhone']; //店长电话
                List<Map> recommendList =
                    (_data['recommend'] as List).cast(); // 商品推荐

                String floor1Title =
                    _data['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                String floor2Title =
                    _data['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                String floor3Title =
                    _data['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                List<Map> floor1 = (_data['floor1'] as List).cast(); //楼层1商品和图片
                List<Map> floor2 = (_data['floor2'] as List).cast(); //楼层1商品和图片
                List<Map> floor3 = (_data['floor3'] as List).cast(); //楼层1商品和图片
                return EasyRefresh(
                  key: _easyRefreshKey,
                  firstRefresh: true,
                  behavior: ScrollBehavior(),
                  refreshHeader: ClassicsHeader(
                    key: _headerKey,
                    refreshText: '下拉刷新',
                    refreshReadyText: '正在刷新...',
                    refreshingText: '正在刷新...',
                    refreshedText: '刷新成功',
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    moreInfoColor: Colors.pink,
                    showMore: false,
                    moreInfo: '刷新中',
                  ),
                  refreshFooter: ClassicsFooter(
                    key: _footerKey,
                    loadText: '上拉加载',
                    loadReadyText: '正在加载...',
                    loadingText: '正在加载...',
                    noMoreText: '加载成功',
                    loadedText: '加载成功',
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    moreInfoColor: Colors.pink,
                    showMore: false,
                    moreInfo: '加载中',
                  ),
                  child: ListView(
                    children: <Widget>[
                      SwiperDiy(swiperList: swiperList),
                      TopNavigator(navigatorList: navigatorList),
                      AdBanner(advertesPicture: advertesPicture),
                      LeaderPhone(
                          leaderImage: leaderImage, leaderPhone: leaderPhone),
                      HomeRecommend(recommendList: recommendList),
                      FloorWidget(
                        floorTitle: floor1Title,
                        floorGoodList: floor1,
                      ),
                      FloorWidget(
                        floorTitle: floor2Title,
                        floorGoodList: floor2,
                      ),
                      FloorWidget(
                        floorTitle: floor3Title,
                        floorGoodList: floor3,
                      ),
                      _hotGoods(),
                    ],
                  ),
                  onRefresh: () async {
                    setState(() {
                      page = 1;
                      hotGoodsList = [];
                    });
                    sendRequest('homePageContent', formData: formData);
                  },
                  loadMore: () async {
                    var formPage = {'page': page};
                    await sendRequest('homePageBelowConten', formData: formPage)
                        .then((val) {
                      var data = json.decode(val.toString());
                      var _data = data['data'];
                      if (_data != null) {
                        List<Map> newGoodsList = (_data as List).cast();
                        setState(() {
                          hotGoodsList.addAll(newGoodsList);
                          page++;
                        });
                      }
                    });
                  },
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('数据加载失败,请检查网络设置'),
                    RaisedButton(
                        child: Text('重新加载'),
                        onPressed: () =>
                            sendRequest('homePageContent', formData: formData))
                  ],
                ));
              }
            } else {
              return Center(child: Text('加载中...'));
            }
          },
        ));
  }

  Widget _hotTitle = Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(6.0),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  Widget _wrapList() {
    List<Widget> data = hotGoodsList.map((val) {
      return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(375),
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text(
                      '￥${val['price']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ));
    }).toList();
    return (Wrap(
      spacing: 2,
      children: data,
    ));
  }

  Widget _hotGoods() {
    return Container(
        child: Column(
      children: <Widget>[_hotTitle, _wrapList()],
    ));
  }
}
