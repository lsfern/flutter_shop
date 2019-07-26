import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/server_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, result) {
            if (result.hasData) {
              var data = json.decode(result.data.toString());
              var _data = data['data'];
              if (_data != null) {
                List<Map> swiperList = (_data['slides'] as List).cast();
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperList: swiperList),
                  ],
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
                        onPressed: () => getHomePageContent())
                  ],
                ));
              }
            } else {
              return Center(child: Text('加载中...'));
            }
          },
        ));
  }
}

///首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperList;
  SwiperDiy({Key key, this.swiperList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperList[index]['image']}",fit: BoxFit.fill,);
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
