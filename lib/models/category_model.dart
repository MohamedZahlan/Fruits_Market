class CategoryModel {
  bool? status;
  CategoryData? data;
  //named constructor
  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoryData.fromJson(json['data']);
  }
}

class CategoryData {
  int? currentPage;
  List<DataForCategory> data = [];
  int? total;
  String? path;
  //named constructor
  CategoryData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    total = json['total'];
    path = json['path'];
    json['data'].forEach((element) {
      data.add(DataForCategory.fromJson(element));
    });
  }
}

class DataForCategory {
  int? id;
  String? name;
  String? image;
  //named constructor
  DataForCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
