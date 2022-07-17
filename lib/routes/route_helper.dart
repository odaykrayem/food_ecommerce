import 'package:food_ecommerce/pages/cart/cart_page.dart';
import 'package:food_ecommerce/pages/food/popular_food_detail.dart';
import 'package:food_ecommerce/pages/food/recommended_food_detail.dart';
import 'package:food_ecommerce/pages/home/home_page.dart';
import 'package:food_ecommerce/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const initial = "/";
  static const popularFood = "/popular-food";
  static const recommendedFood = "/recommended-food";
  static const cartPage = "/cart-page";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];

          return RecommendedFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
