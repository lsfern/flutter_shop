import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class MemberPage extends StatefulWidget  {
 
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> with AutomaticKeepAliveClientMixin{
   @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
          child: Provide<Counter>(
            builder: (context, child, counter) {
              return Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
        ));
  }
}
