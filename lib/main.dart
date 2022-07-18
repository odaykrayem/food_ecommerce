import 'package:flutter/material.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_ecommerce/controllers/recommended_product_controller.dart';
import 'package:food_ecommerce/localization/localization.dart';
import 'package:food_ecommerce/pages/cart/cart_page.dart';
import 'package:food_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:food_ecommerce/pages/home/food_page_body.dart';
import 'package:food_ecommerce/pages/home/main_food_page.dart';
import 'package:food_ecommerce/pages/splash/splash_page.dart';
import 'package:food_ecommerce/routes/route_helper.dart';
import 'package:food_ecommerce/utils/cacheHelper.dart';
import 'package:get/get.dart';
import 'package:food_ecommerce/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.init();

  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // CacheHelper.saveData(key: SharedPrefsKeys.languageCode, value: 'en');

    Get.find<CartController>().getCartdata();
    //we put these nested GetBuilders to solve
    //the problem of calling controllers after GetMaterialApp

    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          locale: Locale('en'),
          translations: AppLocalization(),
        );
      });
    });
  }
}
