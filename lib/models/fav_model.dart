class FavModel {
  bool? status;
  FavData? data;
  //named constructor
  FavModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = FavData.fromJson(json['data']);
  }
}

class FavData {
  int? currentPage;
  List<DataForFav> data = [];
  String? path;
  int? total;
  //named constructor
  FavData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    path = json['path'];
    total = json['total'];
    json['data'].forEach((element) {
      data.add(DataForFav.fromJson(element));
    });
  }
}

class DataForFav {
  int? id;
  DataProduct? product;
  //named constructor
  DataForFav.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = DataProduct.fromJson(json['product']);
  }
}

class DataProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  //named constructor
  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
