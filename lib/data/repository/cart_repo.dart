// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ecommerce/models/cart_model.dart';
import 'package:food_ecommerce/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstants.CART_LIST_KEY);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST_KEY);
    // return;
    var time = DateTime.now().toString();
    cart = [];
    /**
     * canvert objects to String because SharedPrefs only accept Strings *_*
     */
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST_KEY, cart);
    // debugPrint('cart repo : ${sharedPreferences.getStringList(AppConstants.CART_LIST_KEY)}');
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST_KEY)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST_KEY)!;
      // debugPrint('cart repo 2 : ${carts.toString()}');
    }
    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST_KEY)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST_KEY)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST_KEY)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST_KEY)!;
    }
    for (int i = 0; i < cart.length; i++) {
      debugPrint('cart repo : carts : ${cart[i]}');
      cartHistory.add(cart[i]);
    }

    removeCart();
    sharedPreferences.setStringList(
      AppConstants.CART_HISTORY_LIST_KEY,
      cartHistory,
    );
    debugPrint(
        'cart repo : the length of history list is :${getCartHistoryList().length}');
    for (int i = 0; i < getCartHistoryList().length; i++) {
      debugPrint(
          'cart repo : the time for the order is ${getCartHistoryList()[i].time}');
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST_KEY);
  }
}
