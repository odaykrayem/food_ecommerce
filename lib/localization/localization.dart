// ignore_for_file: unused_local_variable
import 'package:food_ecommerce/languages/ar.dart';
import 'package:food_ecommerce/languages/en.dart';
import 'package:get/get.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': arabic, 'en': english};
}
