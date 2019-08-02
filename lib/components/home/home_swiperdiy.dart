/*
 * @Author: Zww
 * @Date: 2019-07-30 10:26:14
 * @LastEditors: Zww
 * @LastEditTime: 2019-08-02 18:59:59
 * @Description: 首页轮播图组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperList;
  SwiperDiy({Key key, this.swiperList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil.screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Applcation.router.navigateTo(
                    context, '/detail?id=${swiperList[index]['goodsId']}');
              },
              child: Image.network(
                "${swiperList[index]['image']}",
                fit: BoxFit.fill,
              ));
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
