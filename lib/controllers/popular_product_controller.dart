// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/models/cart_model.dart';
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

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

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
    debugPrint('quantity : $_quantity');
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      // deb
      _quantity = checkQuantity(_quantity - 1);
      debugPrint('${_inCartItems}');
    }
    update();
  }

  int checkQuantity(int quantity) {
    debugPrint('nnnn : ${_inCartItems + quantity}');
    debugPrint('qqq : ${quantity}');
    debugPrint('iii : ${_inCartItems}');
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('itemCount'.tr, 'youCantReduceMore'.tr,
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      // _inCartItems = 0;
      return 0;
    } else if ((_inCartItems + quantity) > 5) {
      Get.snackbar('itemCount'.tr, 'youCantAddMore'.tr,
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      return 5;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    debugPrint('popular product : The quantity in the cart is $_inCartItems');
    //if exist
    //get from storage _inCartItems=
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
    _cart.items.forEach((key, value) {
      debugPrint(
          'ppopular product cont: The id is: ${value.id.toString()} + The quantity is : ${value.quantity}');
    });
  }

  int get totalItems {
    return _cart.getTotalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
