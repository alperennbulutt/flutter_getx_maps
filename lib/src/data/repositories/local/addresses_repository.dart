import 'package:flutter_getx_maps/src/data/models/addresses.dart';
import 'package:flutter_getx_maps/src/data/providers/local/local_addresses.dart';
import 'package:get/get.dart';

class AddressesRepository {
  final AddressesProvider _addressesProvider = Get.find<AddressesProvider>();

  Future<List<Addresses>> getAddresses() =>
      _addressesProvider.getListAddresses();
}
