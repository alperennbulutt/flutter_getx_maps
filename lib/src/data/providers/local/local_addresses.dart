import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_getx_maps/src/data/models/addresses.dart';

class AddressesProvider {
  List<Addresses> _addresses = [];

  Future<List<Addresses>> getListAddresses() async {
    final String addressesString =
        await rootBundle.loadString('assets/addresses.json');

    _addresses = (jsonDecode(addressesString) as List)
        .map((e) => Addresses.fromJson(e))
        .toList();
    return _addresses;
  }
}
