import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
          child: Text('个人中心'),
        ));
  }
}
