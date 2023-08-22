class SubCategoryModel {
  int? id;
  int? catId;
  int isFav = 0;
  int quantity = 1;
  int colorPosition = -1;

  String? icon;
  List<String> image=[];
  String? name;
  String? desc;
  double? price;
  String? priceCurrency;

  // String? categoryName;
  // String? tags;
  int review = 1;
  String? reviewDesc = "(4.8)";
}
