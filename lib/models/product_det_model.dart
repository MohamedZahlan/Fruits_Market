class ProductModel {
  bool? status;
  ProductData? data;
  //named constructor
  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = ProductData.fromJson(json['data']);
  }
}

class ProductData {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String> images = [];
  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
  }
}
