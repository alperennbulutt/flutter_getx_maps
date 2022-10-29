// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/data/models/addresses.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MapsController extends GetxController {
  ///<---Repositories

  ///--->
  ///<---List
  Addresses _addresses = Addresses(
    name: "",
    streets: "",
    number: 0,
    road: "",
    neighborhood: "",
    latitud: 0,
    longitud: 0,
  );
  Addresses get addresses => _addresses;

  ///--->
  ///<---Loading
  bool _loading = true;
  bool get loading => _loading;
  Future<void> _load() async {
    try {
      await _getLocationData();
      _loading = false;
      update(['maps']);
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
  ///<---GetLocation
  double _latitud = 0, _longitud = 0;
  double get latitud => _latitud;
  double get longitud => _longitud;

  Future<void> _getLocationData() async {
    Location location = Location();

    bool serviceEnabled = false;
    PermissionStatus permissionGranted = PermissionStatus.granted;
    LocationData locationData = LocationData.fromMap({});

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    if (locationData.latitude != null && locationData.longitude != null) {
      _latitud = locationData.latitude!;
      _longitud = locationData.longitude!;
    } else {
      _latitud = 21.9921;
      _longitud = -99.0122;
    }
    print("latitud::: $_latitud  --  Longitud::: $longitud");
  }

  ///--->
  ///<---overriders
  @override
  void onInit() {
    _addresses = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    _load();
    super.onReady();
  }

  ///--->
}
