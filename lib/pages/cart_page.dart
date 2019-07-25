import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('购物车'),
      ),
    );
  }
}
