import 'package:flutter/material.dart';
import 'package:food_ecommerce/utils/colors.dart';
import 'package:food_ecommerce/utils/dimensions.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          Container(
            height: Dimensions.screenHeight * 0.25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: AssetImage('assets/image/logo part 1.png'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1, 10),
                    color: Colors.grey.withOpacity(0.2)),
              ],
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email'.tr, //TODO
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.yeallowColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius30,
                  ),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius30,
                  ),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
