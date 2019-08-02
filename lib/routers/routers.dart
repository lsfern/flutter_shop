import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import '../routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String categoryDetailPage = '/detail';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTER IS NOT FOUND!!!');
      //TODO: return router not found page widget
      return Container(
        child: Text('ROUTER IS NOT FOUND!!!'),
      );
    });
    router.define(categoryDetailPage, handler: goodDetailetailHandler);
  }
}
