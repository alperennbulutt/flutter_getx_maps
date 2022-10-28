// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/data/models/direcciones.dart';
import 'package:flutter_getx_maps/src/data/repositories/local/addresses_repository.dart';
import 'package:flutter_getx_maps/src/routers/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ///<--- Repositories
  final AddressesRepository _addressesRepository =
      Get.find<AddressesRepository>();

  ///--->
  ///<---List
  List<Addresses> _addresses = [];
  List<Addresses> get addresses => _addresses;

  ///--->
  ///<---overriders
  @override
  onReady() {
    _load();
    super.onReady();
  }

  ///--->
  ///<---Loading
  bool _loading = true;
  bool get loading => _loading;

  Future<void> _load() async {
    try {
      _addresses = await _addressesRepository.getAddresses();
      print("Direcciones::::: ${_addresses.length} ");

      _loading = false;
      update(['home']);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  ///--->
  ///<---goToMap
  void goToMap(Addresses direccion) {
    Get.toNamed(AppRoutes.MAPS, arguments: direccion);
  }

  ///--->

}
