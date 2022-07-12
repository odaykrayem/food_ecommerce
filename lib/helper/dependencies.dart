import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_ecommerce/controllers/recommended_product_controller.dart';
import 'package:food_ecommerce/data/api/api_client.dart';
import 'package:food_ecommerce/data/repository/cart_repo.dart';
import 'package:food_ecommerce/data/repository/popular_product_repo.dart';
import 'package:food_ecommerce/data/repository/recommended_product_repo.dart';
import 'package:food_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //TODO:  Add base url

  //api clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(
      apiClient: Get.find())); //get will auto find the api client
  Get.lazyPut(() => RecommendedProductRepo(
      apiClient: Get.find())); //get will auto find the api client
  Get.lazyPut(() => CartRepo()); //get will auto find the api client

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
