import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cate_info.dart';
import 'package:provide/provide.dart';
import '../../provide/cate_goods.dart';

/// Author: ZWW
/// Date: 2019/8/6 10:05
/// Description: 购物车加减数量组件

class CartCount extends StatelessWidget {
  final CateInfoModel cateInfoModel;

  CartCount(this.cateInfoModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 10.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.black12)),
      child: Row(
        children: <Widget>[
          _addOrReduceNum(context, 'reduce'),
          _num(context),
          _addOrReduceNum(context, 'add')
        ],
      ),
    );
  }

  /// 数量增加或减少 by [todo]
  Widget _addOrReduceNum(context, String todo) {
    BoxBorder left =
        Border(left: BorderSide(width: 1.0, color: Colors.black12));
    BoxBorder right =
        Border(right: BorderSide(width: 1.0, color: Colors.black12));
    BoxBorder border = todo == 'add' ? left : right;

    /// 数量为1且是减少操作
    bool isShowReduce = (cateInfoModel.count == 1 && todo != 'add');
    return InkWell(
      onTap: () {
        if (isShowReduce) {
          return;
        }
        Provide.value<CateGoodProvide>(context)
            .shopCountAddOrReduceAction(cateInfoModel, todo);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: isShowReduce ? Colors.black12 : Colors.white, border: border),
        child: Text(todo == 'add' ? '+' : (isShowReduce ? '' : '-')),
      ),
    );
  }

  /// 数量
  Widget _num(context) {
    return Provide<CateGoodProvide>(
      builder: (context, child, val) {
        return Container(
          width: ScreenUtil().setWidth(70),
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,
          color: Colors.white,
          child: Text('${cateInfoModel.count}'),
        );
      },
    );
  }
}
