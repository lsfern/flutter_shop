import 'package:flutter/material.dart';
import 'dart:convert';
import '../components//home/home_swiperdiy.dart';
import '../components//home/home_navigator.dart';
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
                List<Map> navigatorList = (_data['category'] as List).cast();
                
                return Column(
                  children: <Widget>[
                    SwiperDiy(swiperList: swiperList),
                    TopNavigator(navigatorList: navigatorList)
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
