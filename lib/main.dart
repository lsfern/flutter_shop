import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provide/provide.dart';
import './routers/application.dart';
import './routers/routers.dart';
import './pages/index_page.dart';
import './provide/counter.dart';
import './provide/child_catrgory.dart';
import './provide/category_list.dart';
import './provide/goods_detail.dart';

void main() {
  var providers = Providers();
  var counter = Counter();
  var childCatrgory = ChildCategory();
  var categoryListProvide = CategoryListProvide();
  var goodsDetailProvide = GoodsDetailProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCatrgory))
    ..provide(Provider<CategoryListProvide>.value(categoryListProvide))
    ..provide(Provider<GoodsDetailProvide>.value(goodsDetailProvide));
  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Applcation.router = router;
    return Container(
      child: MaterialApp(
          title: '百姓生活+',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Applcation.router.generator,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
