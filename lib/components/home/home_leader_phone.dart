import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Author: ZWW
/// Date: 2019-07-30 11:58:23
/// Description: 店长电话组件

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Image.network(leaderImage),
    );
  }

  void _launchURL() async {
    String url = 'tel:'+leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
