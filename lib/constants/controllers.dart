

import 'package:royal_designe/controller/appcontroller.dart';
import 'package:royal_designe/controller/auth_controller.dart';
import 'package:royal_designe/controller/cart_controller.dart';
import 'package:royal_designe/controller/category_controller.dart';
import 'package:royal_designe/controller/langague_controller.dart';
import 'package:royal_designe/controller/payment_controller.dart';
import 'package:royal_designe/controller/product_controller.dart';
import 'package:royal_designe/controller/theam_controller.dart';

AuthController authController = AuthController.instance;
AppController appController = AppController.instance;
ProductController productController = ProductController.instance;
CartController cartController = CartController.instance;
PaymentsController paymentController = PaymentsController.instance;
CategoryController categoryController = CategoryController.instance;
LanguageController languageController = LanguageController.to;
ThemeController themeController = ThemeController.to;

