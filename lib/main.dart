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
import './provide/cate_goods.dart';

void main() {
  var providers = Providers();
  var counter = Counter();
  var childCategory = ChildCategory();
  var categoryListProvide = CategoryListProvide();
  var goodsDetailProvide = GoodsDetailProvide();
  var cateGoodProvide = CateGoodProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryListProvide>.value(categoryListProvide))
    ..provide(Provider<GoodsDetailProvide>.value(goodsDetailProvide))
    ..provide(Provider<CateGoodProvide>.value(cateGoodProvide));
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
    Application.router = router;
    return Container(
      child: MaterialApp(
          title: '百姓生活+',
          debugShowCheckedModeBanner: true,
          onGenerateRoute: Application.router.generator,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
