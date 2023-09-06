import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Section_Model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _productList = [];
  List<Product> _originalProductList = [];

  get productList => _productList;
  // get originaProductList => _originalProductList;

  removeCompareList() {
    _productList.clear();

    notifyListeners();
  }

  setProductList(List<Product>? productList) {
    _productList = productList!;
    _productList = _productList.map(
      (e) {
        e.prVarientList!.sortBy<num>((x) => double.parse(x.price!));
        return e;
      },
    ).toList();
    _originalProductList = _productList;
    notifyListeners();
  }

  setFilteredProductList(String searchText, List catList) {
    // _filteredProductList = productList!;
    if (searchText != "") {
      _productList = _originalProductList
          .where((e) =>
              e.name!.toLowerCase().contains(searchText.toLowerCase()) ||
              e.catName!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    if (catList.isNotEmpty) {
      _productList = _productList
          .where((e) => catList.any((element) => e.catName == element.name))
          .toList();
    }
    if (catList.isEmpty && searchText == "") {
      _productList = _originalProductList;
    }
    notifyListeners();
  }

  setFilterPriceBrandList(List catList, List<double> priceRange) {
    // _filteredProductList = productList!;
    _productList = _originalProductList;
    if (catList.isNotEmpty) {
      _productList = _productList
          .where((e) => catList.any(
              (element) => e.catName!.toLowerCase() == element.toLowerCase()))
          .toList();
    }

    _productList = _productList
        .where((item) => item.prVarientList!.any((element) =>
            double.parse(element.price!) >= priceRange[0] &&
            double.parse(element.price!) <= priceRange[1]))
        .toList();
    notifyListeners();
  }

  sort({isDesc = false}) {
    _productList.sortByCompare<num>(
      (a) => a.prVarientList!.map((e) => double.parse(e.price!)).min,
      (a, b) => isDesc ? b.compareTo(a) : a.compareTo(b),
    );
    notifyListeners();
  }
}
