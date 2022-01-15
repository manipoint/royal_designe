


import 'package:get/get.dart';
import 'package:royal_designe/pages/auth/address.dart';
import 'package:royal_designe/pages/auth/auth.dart';
import 'package:royal_designe/pages/auth/login.dart';
import 'package:royal_designe/pages/auth/signup.dart';
import 'package:royal_designe/pages/checkout.dart';
import 'package:royal_designe/pages/dishes.dart';
import 'package:royal_designe/pages/home.dart';
import 'package:royal_designe/pages/profile.dart';
import 'package:royal_designe/pages/search.dart';
import 'package:royal_designe/pages/splash.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/address', page: () => UserAddress()),
    GetPage(name: '/authentication', page: () => AuthenticationScreen()),
    GetPage(name: '/login', page: () => LoginWidget()),
    GetPage(name: '/signup', page: () =>  RegistrationWidget()),
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/view_all', page: () => const ViewAllScreen()),
    GetPage(name: '/cart-page', page: () => const CartPage()),
    GetPage(name: '/profile', page: () => const Profile()),
    GetPage(name: '/search-page', page: () =>  const SearchPage()),
  ];
}