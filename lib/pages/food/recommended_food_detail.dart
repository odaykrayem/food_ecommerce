// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/controllers/popular_product_controller.dart';
import 'package:food_ecommerce/controllers/recommended_product_controller.dart';
import 'package:food_ecommerce/models/products_model.dart';
import 'package:food_ecommerce/pages/cart/cart_page.dart';
import 'package:food_ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:food_ecommerce/routes/route_helper.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:food_ecommerce/widgets/app_icon.dart';
import 'package:food_ecommerce/widgets/big_text.dart';
import 'package:food_ecommerce/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    // var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5, //50
                right: Dimensions.width20 * 2.5, //50
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        backgroundColor: AppColors.mainColor),
                  ),
                  Directionality(
                    // by me
                    textDirection: TextDirection.ltr,
                    child: BigText(
                      text:
                          '\$ ${product.price!} X  ${controller.inCartItems} ',
                      color: AppColors.mainBlackColor,
                      size: Dimensions.font26,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                        backgroundColor: AppColors.mainColor),
                  ),
                ],
              ),
            ),
            Container(
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
                      padding: EdgeInsets.only(
                          top: Dimensions.height15, //20
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      height: Dimensions.height60, //by me
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
                        // by me
                        child: Directionality(
                          // by me
                          textDirection: TextDirection.ltr,
                          child: BigText(
                            text: "\$ ${product.price!} | ${'addToCart'.tr}",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: const AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
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
                    );
                  }),
                ]),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
                child: Center(
                    child: BigText(
                  text: product.name!,
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yeallowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!,
                    width: double.maxFinite,
                    fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
