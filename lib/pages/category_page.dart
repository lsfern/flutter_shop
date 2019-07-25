import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('分类页面'),
      ),
    );
  }
}
