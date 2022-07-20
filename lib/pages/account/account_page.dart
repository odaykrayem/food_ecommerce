import 'package:flutter/material.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:food_ecommerce/widgets/account_widget.dart';
import 'package:food_ecommerce/widgets/app_icon.dart';
import 'package:food_ecommerce/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: BigText(
          text: 'profile'.tr,
          color: Colors.white,
          size: Dimensions.font26,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          top: Dimensions.height20,
        ),
        child: Column(
          children: [
            //Profile Icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              // iconSize: Dimensions.height45 + Dimensions.height30,
              // size: Dimensions.height15 * 10,
              //By Me
              iconSize: Dimensions.height15 * 6,
              size: Dimensions.height15 * 11,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: 'Oday'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yeallowColor,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: '009273627'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yeallowColor,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: 'iidon@gmail.com'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yeallowColor,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: 'fillInYourAddress'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Messages
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: 'Messages'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Messages 2
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        // iconSize: Dimensions.height25,
                        iconSize: Dimensions.height30,
                        // size: Dimensions.height10 * 5,
                        size: Dimensions.height10 * 6,
                      ),
                      bigText: BigText(text: 'Oday'),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
