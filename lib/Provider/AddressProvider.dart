import 'package:flutter/material.dart';
import 'package:petcare/model/AddressModel.dart';
import 'package:petcare/model/User.dart';
import 'package:collection/collection.dart';

class AddressProvider extends ChangeNotifier {
  List<User?> _addressList = [];

  get addressList => _addressList;

  setAddressList(List<User>? addressList) {
    _addressList.addAll(addressList!);
    print("_addressList $_addressList");
    notifyListeners();
  }

  setDefaultAddress(int index) {
    _addressList = _addressList.mapIndexed((i, item) {
      if (i == index) {
        print("Selected address: $item");
        item!.isDefault = "1";
      } else {
        item!.isDefault = "0";
      }
      return item;
    }).toList();
    notifyListeners();
  }
}
