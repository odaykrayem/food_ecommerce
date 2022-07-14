import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_ecommerce/controllers/cart_controller.dart';
import 'package:food_ecommerce/pages/home/main_food_page.dart';
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
                  Get.to(() => MainFoodPage());
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
        Positioned(
            top: Dimensions.height20 * 6, //5
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(bottom: Dimensions.height10),
                          child: Row(children: [
                            Container(
                              width: Dimensions.height20 * 5,
                              height: Dimensions.height20 * 5,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        cartController.getItems[index].img!)),
                              ),
                              // child: Asset,
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Expanded(
                                child: Container(
                              height: Dimensions.font20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartController.getItems[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(
                                    text: 'cartController.getItems[index].!',
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
                                        height: Dimensions.height45, //by me
                                        padding: EdgeInsets.only(
                                            // top: Dimensions.height10,
                                            // bottom: Dimensions.height10,
                                            left: Dimensions.width10,
                                            right: Dimensions.width10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
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
                                                    // popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(Icons.remove,
                                                      color:
                                                          AppColors.signColor)),
                                              SizedBox(
                                                // width: Dimensions.width10 / 2,
                                                width: Dimensions.width20,
                                              ),
                                              BigText(
                                                  text:
                                                      'jj' //'${popularProduct.inCartItems}',
                                                  ),
                                              SizedBox(
                                                // width: Dimensions.width10 / 2,
                                                width: Dimensions.width20,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(Icons.add,
                                                      color:
                                                          AppColors.signColor)),
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
            )),
      ]),
    );
  }
}
