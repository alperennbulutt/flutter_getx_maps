import 'package:flutter/material.dart';
import 'package:flutter_getx_maps/src/data/models/direcciones.dart';
import 'package:flutter_getx_maps/src/global_widgets/splash.dart';
import 'package:flutter_getx_maps/src/pages/home/home_controller.dart';
import 'package:flutter_getx_maps/src/pages/home/local_widgets/addresses_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'home',
      builder: (_) {
        if (_.loading) {
          return const Splash(mensaje: "Loading");
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Addresses"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: ListView.builder(
            itemBuilder: (ctx, index) {
              final Addresses addresses = _.addresses[index];
              return AddressesItem(addresses: addresses);
            },
            itemCount: _.addresses.length,
          ),
        );
      },
    );
  }
}
