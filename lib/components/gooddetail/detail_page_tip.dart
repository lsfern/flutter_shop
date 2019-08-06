import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Author: ZWW
/// Date: 2019-08-02 16:56
/// Description: 商品详情说明组件

class DetailPageTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 15.0),
      width: ScreenUtil().setWidth(730),
      child: Text('说明：>急速送达>正品保证',
          style:
              TextStyle(color: Colors.green, fontSize: ScreenUtil().setSp(28))),
    );
  }
}
