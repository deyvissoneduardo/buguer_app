import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/login_page.dart';
import '../../auth/register/register_page.dart';
import '../../home/home_page.dart';
import '../../template/base_layout.dart';

class AppRoutes {
  static const LOGIN_PAGE = '/login_page';
  static const REGISTER_PAGE = '/register';
  static const TEMPLATE_PAGE = '/base_layout';
  static const HOME_PAGE = '/home';

  static List<GetPage> pages = [
    GetPage(name: LOGIN_PAGE, page: () => const LoginPage()),
    GetPage(
      name: REGISTER_PAGE,
      page: () => const RegisterPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(name: HOME_PAGE, page: () => const HomePage()),
    GetPage(
      name: TEMPLATE_PAGE,
      page: () => const BaseLayout(body: Material()),
      transition: Transition.leftToRight,
    ),
  ];
}
