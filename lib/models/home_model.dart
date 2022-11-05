class HomeModel {
  bool? status;
  HomeData? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeData.fromJson(json['data']);
  }
}

class HomeData {
  List<Banners> banners = [];
  List<ProductsData> product = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
    json['products'].forEach((element) {
      product.add(ProductsData.fromJson(element));
    });
  }
}

class Banners {
  int? id;
  String? image;

  Banners.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
  }
}

class ProductsData {
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorite;
  bool? inCart;

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
