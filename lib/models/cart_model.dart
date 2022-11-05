class CartModel {
  bool? status;
  CartData? data;

  //named constructor
  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CartData.fromJson(json['data']);
  }
}

class CartData {
  List<CartItems> cartItem = [];
  dynamic total;
  //named constructor
  CartData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    json['cart_items'].forEach((element) {
      cartItem.add(CartItems.fromJson(element));
    });
  }
}

class CartItems {
  int? id;
  int? quantity;
  CartProducts? product;
  //named constructor
  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = CartProducts.fromJson(json['product']);
  }
}

class CartProducts {
  int? id;
  dynamic price;
  dynamic oldPrice;
  String? image;
  String? name;
  dynamic discount;
  //named constructor
  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    name = json['name'];
    discount = json['discount'];
  }
}
