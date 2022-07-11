// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/products_model.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:get/get.dart';
import 'package:food_ecommerce/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      debugPrint('product controller : product got');
      _popularProductList = []; //initialze to not repeat data
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('product controller : could not get product');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(quantity + 1);
    } else {
      _quantity = checkQuantity(quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar('itemCount'.tr, 'youCantReduceMore'.tr,
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 3) {
      Get.snackbar('itemCount'.tr, 'youCantAddMore'.tr,
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      return 3;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
  }
}
