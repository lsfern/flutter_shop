/*
 * @Author: Zww
 * @Date: 2019-07-30 11:30:29
 * @LastEditors: Zww
 * @LastEditTime: 2019-07-30 11:32:26
 * @Description: 首页AdBanner组件
 */

import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.network(advertesPicture));
  }
}
