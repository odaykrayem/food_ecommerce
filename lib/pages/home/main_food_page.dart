import 'package:flutter/material.dart';
import 'package:food_ecommerce/pages/home/food_page_body.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:food_ecommerce/widgets/big_text.dart';
import 'package:food_ecommerce/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // setArabic(context);
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //  crossAxisAlignment: CrossAxisAlignmen.start, //this will be better with less letters word like UAE
                    children: [
                      BigText(
                        text: "Syria arab",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Sharjah",
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing the body
          const Expanded(child: SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }

  // void setArabic(BuildContext context) {
  //   MyApp.setLocale(context, const Locale('ar', 'SA'));

  //   String languageCode = 'ar';
  //   String countryCode = 'SA';
  //   CacheHelper.saveData(
  //       key: SharedPrefsKeys.languageCode, value: languageCode);
  //   CacheHelper.saveData(key: SharedPrefsKeys.countryCode, value: countryCode);
  // }

  // void setEnglish() {
  //   MyApp.setLocale(context, const Locale('en', 'US'));
  //   String languageCode = 'en';
  //   String countryCode = 'US';
  //   CacheHelper.saveData(
  //       key: SharedPrefsKeys.languageCode, value: languageCode);
  //   CacheHelper.saveData(key: SharedPrefsKeys.countryCode, value: countryCode);
  // }
}
