import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ecommerce/base/no_data_page.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_ecommerce/controllers/recommended_product_controller.dart';
import 'package:food_ecommerce/pages/home/home_page.dart';
import 'package:food_ecommerce/pages/home/main_food_page.dart';
import 'package:food_ecommerce/routes/route_helper.dart';
import 'package:food_ecommerce/utils/app_constants.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:food_ecommerce/widgets/app_icon.dart';
import 'package:food_ecommerce/widgets/big_text.dart';
import 'package:food_ecommerce/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //header
        Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
              SizedBox(
                width: Dimensions.width20 * 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => HomePage());
                },
                child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ),
              AppIcon(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
            ],
          ),
        ),
        //body
        GetBuilder<CartController>(builder: (cartController) {
          return cartController.getItems.length > 0
              ? Positioned(
                  top: Dimensions.height20 * 6, //5
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height15),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child:
                          GetBuilder<CartController>(builder: (cartController) {
                        var _cartList = cartController.getItems;
                        return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                width: double.maxFinite,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      //find the item we clicked to get here
                                      var popularIndex =
                                          Get.find<PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);

                                      if (popularIndex >= 0) {
                                        Get.toNamed(RouteHelper.getPopularFood(
                                            popularIndex, 'cartpage'));
                                      } else {
                                        var recommendedIndex = Get.find<
                                                RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product!);
                                        if (recommendedIndex < 0) {
                                          Get.snackbar(
                                            'historyProduct'.tr,
                                            'productReviewIsNotAvailableForHistoryProduct'
                                                .tr,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white,
                                          );
                                        } else {
                                          Get.toNamed(
                                              RouteHelper.getRecommendedFood(
                                                  recommendedIndex,
                                                  'cartpage'));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index].img!)),
                                      ),
                                      // child: Asset,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.font20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(
                                          text:
                                              'cartController.getItems[index].!',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  '\$ ${cartController.getItems[index].price}',
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              height:
                                                  Dimensions.height45, //by me
                                              padding: EdgeInsets.only(
                                                  // top: Dimensions.height10,
                                                  // bottom: Dimensions.height10,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center, //by me
                                                  children: [
                                                    InkWell(
                                                        //he used getsuredetector
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                        },
                                                        child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor)),
                                                    SizedBox(
                                                      // width: Dimensions.width10 / 2,
                                                      width: Dimensions.width20,
                                                    ),
                                                    BigText(
                                                        text:
                                                            '${_cartList[index].quantity}'),
                                                    SizedBox(
                                                      // width: Dimensions.width10 / 2,
                                                      width: Dimensions.width20,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          cartController
                                                              .addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .signColor)),
                                                  ]),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                                ]),
                              );
                            });
                      }),
                    ),
                  ))
              : NoDataPage(text: 'yourCartIsEmpty'.tr);
        }),
      ]),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: cartController.getItems.length > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Dimensions.height60, //by me
                      padding: EdgeInsets.only(
                          // top: Dimensions.height20,
                          // bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, //by me
                          children: [
                            SizedBox(
                              // width: Dimensions.width10 / 2,
                              width: Dimensions.width20,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: BigText(
                                text: '\$ ${cartController.totalAmount}',
                              ),
                            ),
                            SizedBox(
                              // width: Dimensions.width10 / 2,
                              width: Dimensions.width20,
                            ),
                          ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.addToHitory();
                      },
                      child: Container(
                        height: Dimensions.height60,
                        padding: EdgeInsets.only(
                          // top: Dimensions.height20,
                          // bottom: Dimensions.height20,
                          left: Dimensions.width30, //width20
                          right: Dimensions.width30, //width20
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          //by me
                          child: Directionality(
                            //by me
                            textDirection: TextDirection.ltr,
                            child: BigText(
                              text: 'checkout'.tr,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      }),
    );
  }
}
