import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('商城首页'),
      ),
    );
  }
}
