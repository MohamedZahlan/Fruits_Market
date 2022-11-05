class AddFavModel {
  bool? status;
  String? message;
  AddFavData? data;
  AddFavModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = AddFavData.fromJson(json['data']);
  }
}

class AddFavData {
  int? id;
  AddFavProduct? product;
  AddFavData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = AddFavProduct.fromJson(json['product']);
  }
}

class AddFavProduct {
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  AddFavProduct.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }
}
