// ignore_for_file: prefer_const_constructors

import 'package:flutter_getx_maps/src/pages/home/home_bindig.dart';
import 'package:flutter_getx_maps/src/pages/home/home_page.dart';
import 'package:flutter_getx_maps/src/pages/maps/maps_binding.dart';
import 'package:flutter_getx_maps/src/pages/maps/maps_page.dart';
import 'package:flutter_getx_maps/src/routers/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MAPS,
      page: () => MapsPage(),
      binding: MapsBinding(),
    ),
  ];
}
