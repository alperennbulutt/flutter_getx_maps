import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/data/models/direcciones.dart';
import 'package:flutter_getx_maps/src/pages/home/home_controller.dart';
import 'package:get/get.dart';

class AddressesItem extends StatelessWidget {
  final Addresses addresses;
  const AddressesItem({Key? key, required this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return ListTile(
          title: Text(
            addresses.name,
            style: const TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(
            "${addresses.streets} #${addresses.number}, ${addresses.neighborhood}",
          ),
          minVerticalPadding: 5.0,
          trailing: IconButton(
            icon: const Icon(Icons.map),
            color: Colors.green,
            onPressed: () {
              _.goToMap(addresses);
            },
          ),
        );
      },
    );
  }
}
