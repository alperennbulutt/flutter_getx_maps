// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/global_widgets/splash.dart';
import 'package:flutter_getx_maps/src/pages/maps/local_widgets/maps.dart';
import 'package:flutter_getx_maps/src/pages/maps/maps_controller.dart';
import 'package:get/get.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      id: 'maps',
      builder: (_) {
        print('gelen latitu' + _.addresses.latitud.toString());
        print('gelen longitu' + _.addresses.longitud.toString());

        if (_.loading) {
          return const Splash(mensaje: "Loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(_.addresses.name),
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  "Latitude   |   Longitud\n${_.addresses.latitud} | ${_.addresses.longitud}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              const Maps(),
            ],
          ),
        );
      },
    );
  }
}
