import 'package:flutter/cupertino.dart';
import 'package:petcare/Model/Section_Model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Product>? _subList = [];
  int _curCat = 0;

  get subList => _subList;

  get curCat => _curCat;

  setCurSelected(int index) {
    _curCat = index;
    notifyListeners();
  }

  setSubList(List<Product>? subList) {
    _subList = subList;
    notifyListeners();
  }
}
