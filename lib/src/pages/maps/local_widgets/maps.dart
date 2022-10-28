// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/pages/maps/maps_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapsController>(
      builder: (_) {
        return Container(
          width: 350.0,
          height: 460.0,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(_.latitud, _.longitud),
              zoom: 14.2,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.flutter_getx_maps',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    point: LatLng(_.direccion.latitud, _.direccion.longitud),
                  ),
                  Marker(
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    point: LatLng(_.latitud, _.longitud),
                  ),
                ],
              ),
            ],
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
