class AddCartModel {
  bool? status;
  String? message;
  AddCartData? data;
  //named constructor
  AddCartModel.fromJSon(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = AddCartData.fromJson(json['data']);
  }
}

class AddCartData {
  int? id;
  int? quantity;
  AddCartProduct? product;
  AddCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = AddCartProduct.fromJson(json['product']);
  }
}

class AddCartProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;

  AddCartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
