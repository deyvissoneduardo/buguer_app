import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/login_page.dart';
import '../../auth/register/register_page.dart';
import '../../home/home_page.dart';
import '../../products/detail/product_detail_page.dart';
import '../../products/home/product_page.dart';
import '../../products/product_bindings.dart';
import '../../template/base_layout.dart';

class AppRoutes {
  static const LOGIN_PAGE = '/login_page';
  static const REGISTER_PAGE = '/register';
  static const TEMPLATE_PAGE = '/base_layout';
  static const HOME_PAGE = '/home';
  static const PRODUCT_PAGE = '/product/home';
  static const PRODUCT_DETAIL_PAGE = '/product/detail';

  static List<GetPage> pages = [
    GetPage(name: LOGIN_PAGE, page: () => const LoginPage()),
    GetPage(
      name: REGISTER_PAGE,
      page: () => const RegisterPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: HOME_PAGE,
      page: () => const HomePage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: TEMPLATE_PAGE,
      page: () => const BaseLayout(body: Material()),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: PRODUCT_DETAIL_PAGE,
      page: () => const ProductDetailPage(),
      binding: ProductBindings(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: PRODUCT_PAGE,
      page: () => const ProductPage(),
      binding: ProductBindings(),
      transition: Transition.leftToRight,
    ),
  ];
}
