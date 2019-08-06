import 'package:flutter/material.dart';

/// Author: ZWW
/// Date: 2019-07-30 11:30
/// Description: 首页AdBanner组件

class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.network(advertesPicture));
  }
}
