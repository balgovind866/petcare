import 'package:flutter/cupertino.dart';

import '../model/CardModel.dart';

class ProductCardModel extends ChangeNotifier {
  List<CardModel> _subCatList = [
    CardModel(
      id: 1,
      email: "chloe_bird@gmail.com",
      cardNo: "2342 22** **** **00",
      cVV: "***",
      expDate: "06/23",
      name: "Claudia T. Reyes",
      image: "visa.png",
    ),
    CardModel(
      id: 1,
      email: "chloe_bird@gmail.com",
      cardNo: "2342 22** **** **00",
      cVV: "***",
      expDate: "06/23",
      name: "Claudia T. Reyes",
      image: "visa.png",
    ),

  ];



    List<CardModel> get subCatList =>_subCatList;

   void NewCardAdd(CardModel SubCartList) {
     _subCatList.add(SubCartList);
      notifyListeners();
    }

}