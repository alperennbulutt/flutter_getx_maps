import 'package:flutter_getx_maps/src/data/providers/local/local_addresses.dart';
import 'package:flutter_getx_maps/src/data/repositories/local/addresses_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    ///Providers
    Get.lazyPut<AddressesProvider>(
      () => AddressesProvider(),
      fenix: true,
    );

    ///Repositories
    Get.lazyPut<AddressesRepository>(
      () => AddressesRepository(),
      fenix: true,
    );
  }
}
