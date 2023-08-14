import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/login/login_page.dart';
import '../../auth/register/register_page.dart';
import '../../template/base_layout.dart';

class AppRoutes {
  static const LOGIN_PAGE = '/login_page';
  static const REGISTER_PAGE = '/register';
  static const TEMPLATE_PAGE = '/base_layout';

  static List<GetPage> pages = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(
      name: '/register',
      page: () => const RegisterPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: '/template',
      page: () => const BaseLayout(body: Material()),
      transition: Transition.leftToRight,
    ),
  ];
}
