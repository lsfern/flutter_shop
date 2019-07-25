import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  String showText = '暂时还未获取任何数据';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: _choiceButton,
                  child: Text('请求远程数据'),
                ),
                Text(
                  showText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _choiceButton() {
    print('开始请求接口');
      getHttp().then((val) {
        setState(() {
          showText = val['data'].toString();
        });
      });
  }

  Future getHttp() async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      print(dio.options.headers);
      response = await dio.get(
          'https://time.geekbang.org/serv/v1/column/newAll');
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
