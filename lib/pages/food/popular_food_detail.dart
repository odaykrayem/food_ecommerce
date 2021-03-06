// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_ecommerce/data/repository/popular_product_repo.dart';
import 'package:food_ecommerce/models/products_model.dart';
import 'package:food_ecommerce/pages/cart/cart_page.dart';
import 'package:food_ecommerce/routes/route_helper.dart';
import 'package:food_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:food_ecommerce/pages/home/main_food_page.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:food_ecommerce/widgets/app_column.dart';
import 'package:food_ecommerce/widgets/app_icon.dart';
import 'package:food_ecommerce/widgets/big_text.dart';
import 'package:food_ecommerce/widgets/expandable_text_widget.dart';

//TODO: remove white edges on bottom nav
class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];
    // var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
          child: Row(
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
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.center, //by me
                        children: [
                      InkWell(
                          //he used getsuredetector
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child:
                              Icon(Icons.remove, color: AppColors.signColor)),
                      SizedBox(
                        // width: Dimensions.width10 / 2,
                        width: Dimensions.width20,
                      ),
                      BigText(
                        text: '${popularProduct.inCartItems}',
                      ),
                      SizedBox(
                        // width: Dimensions.width10 / 2,
                        width: Dimensions.width20,
                      ),
                      InkWell(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor)),
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
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
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    //by me
                    child: Directionality(
                      //by me
                      textDirection: TextDirection.ltr,
                      child: BigText(
                        text: "\$ ${product.price} | ${'addToCart'.tr}",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
                ),
              ),
            ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == 'cartpage') {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());

                        // if (controller.totalItems >= 1) {
                        //   Get.toNamed(RouteHelper.getCartPage());
                        // }
                        // else {
                        //   Get.snackbar('noItems'.tr, 'noItemsMsg'.tr);
                        // }
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 6,
                                  top: 3,
                                  child: BigText(
                                    text:
                                        '${Get.find<PopularProductController>().totalItems}',
                                    size: 12,
                                    color: Colors.white,
                                  ))
                              : Container(),
                        ],
                      ),
                    );
                  }),
                ]),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
                padding: EdgeInsets.only(
                  right: Dimensions.width20,
                  left: Dimensions.width20,
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: 'introduce'.tr),
                    //expandable text widget
                    SizedBox(height: Dimensions.height20),
                    Expanded(
                      //TODO://add change notifier to list view
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
