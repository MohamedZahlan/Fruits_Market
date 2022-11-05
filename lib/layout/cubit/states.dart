import 'package:ShopTask/models/add_fav_model.dart';
import 'package:ShopTask/models/cart_model.dart';
import 'package:ShopTask/models/fav_model.dart';

import '../../models/add_cart_model.dart';

abstract class ShopTaskStates {}

class ShopTaskInitialState extends ShopTaskStates {}

class ShopTaskChangeBottomNav extends ShopTaskStates {}

class ShopTaskGetHomeDataLoadingState extends ShopTaskStates {}

class ShopTaskGetHomeDataSuccessState extends ShopTaskStates {}

class ShopTaskGetHomeDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskGetHomeDataErrorState(this.error);
}

class ShopTaskGetCategoryDataSuccessState extends ShopTaskStates {}

class ShopTaskGetCategoryDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskGetCategoryDataErrorState(this.error);
}

class ShopTaskGetCartDataLoadingState extends ShopTaskStates {}

class ShopTaskGetCartDataSuccessState extends ShopTaskStates {}

class ShopTaskGetCartDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskGetCartDataErrorState(this.error);
}

class ShopTaskChangeCartDataLoadingState extends ShopTaskStates {}

class ShopTaskChangeCartDataSuccessState extends ShopTaskStates {
  final AddCartModel addCart;

  ShopTaskChangeCartDataSuccessState(this.addCart);
}

class ShopTaskChangeCartDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskChangeCartDataErrorState(this.error);
}

class ShopTaskChangeCartQuantitySuccessState extends ShopTaskStates {}

class ShopTaskChangeFavDataLoadingState extends ShopTaskStates {}

class ShopTaskChangeFavDataSuccessState extends ShopTaskStates {
  final AddFavModel addFav;

  ShopTaskChangeFavDataSuccessState(this.addFav);
}

class ShopTaskChangeFavDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskChangeFavDataErrorState(this.error);
}

class ShopTaskGetFavDataLoadingState extends ShopTaskStates {}

class ShopTaskGetFavDataSuccessState extends ShopTaskStates {
  final FavModel favModel;

  ShopTaskGetFavDataSuccessState(this.favModel);
}

class ShopTaskGetFavDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskGetFavDataErrorState(this.error);
}

class ShopTaskGetProductDataLoadingState extends ShopTaskStates {}

class ShopTaskGetProductDataSuccessState extends ShopTaskStates {}

class ShopTaskGetProductDataErrorState extends ShopTaskStates {
  final error;

  ShopTaskGetProductDataErrorState(this.error);
}

class ShopChangeProductImageState extends ShopTaskStates {}

class ShopChangeTextCartState extends ShopTaskStates {}
