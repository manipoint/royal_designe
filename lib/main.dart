import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royal_designe/util/app_themes.dart';
import 'package:royal_designe/util/loading.dart';
import 'constants/app_routs.dart';
import 'constants/firebase.dart';
import 'constants/localization.g.dart';
import 'controller/appcontroller.dart';
import 'controller/auth_controller.dart';
import 'controller/cart_controller.dart';
import 'controller/category_controller.dart';
import 'controller/langague_controller.dart';
import 'controller/payment_controller.dart';
import 'controller/product_controller.dart';
import 'controller/theam_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AppController());
    Get.put(AuthController());
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(PaymentsController());
    Get.put(CategoryController());
    Get.put(ThemeController());
    Get.put(LanguageController());
  });
   await GetStorage.init(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
        builder: (languageController)=> LoadingApp(
          child:GetMaterialApp(
             translations: Localization(),
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              locale: languageController.getLocale,
              title: 'app.title'.tr,
             initialRoute: "/",
             getPages: AppRoutes.routes,
            )));
  }
}
