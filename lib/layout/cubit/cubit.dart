import 'package:ShopTask/models/add_cart_model.dart';
import 'package:ShopTask/models/add_fav_model.dart';
import 'package:ShopTask/models/cart_model.dart';
import 'package:ShopTask/models/category_model.dart';
import 'package:ShopTask/models/product_det_model.dart';
import 'package:ShopTask/modules/explore_screen/explore_screen.dart';
import 'package:ShopTask/modules/fav_screen/favorites_screen.dart';
import 'package:ShopTask/modules/home_product/products_screen.dart';
import 'package:ShopTask/modules/profile_screen/profile_screen.dart';
import 'package:ShopTask/shared/network/end_points.dart';
import 'package:ShopTask/shared/network/remote/dio_helper.dart';
import 'package:ShopTask/shared/shared.components/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/fav_model.dart';
import '../../models/home_model.dart';
import '../../modules/cart_screen/cart_screen.dart';
import '../cubit/states.dart';

class ShopTaskCubit extends Cubit<ShopTaskStates> {
  ShopTaskCubit() : super(ShopTaskInitialState());

  static ShopTaskCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomNav = [
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.shop, size: 20),
      label: 'Shop',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.manage_search, size: 30),
      label: 'Explore',
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.cartShopping),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: 'Favourite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Account',
    ),
  ];

  List<Widget> screens = [
    ProductsScreen(),
    ExploreScreen(),
    CartScreen(),
    FavScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopTaskChangeBottomNav());
  }

  Map<int, bool> inFav = {};

  Map<int, bool> inCart = {};

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopTaskGetHomeDataLoadingState());
    Dio_Helper.getData(
      url: HOME,
      token: token,
      lang: 'en',
    ).then((value) {
      emit(ShopTaskGetHomeDataSuccessState());
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel!.data.toString());
      if (kDebugMode) {
        print(homeModel?.data.toString());
        //print(value.data);
      }
      //get product in Fav
      homeModel!.data?.product.forEach((element) {
        inFav.addAll({
          element.id: element.inFavorite!,
        });
        //get product in Cart
        inCart.addAll({
          element.id: element.inCart!,
        });
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskGetHomeDataErrorState(error.toString()));
    });
  }

  CategoryModel? categoryModel;

  void getCategoryData() {
    Dio_Helper.getData(
      url: GET_CATEGORIES,
      lang: 'en',
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(ShopTaskGetCategoryDataSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskGetCategoryDataErrorState(error.toString()));
    });
  }

  CartModel? cartModel;

  void getCartData() {
    emit(ShopTaskGetCartDataLoadingState());
    Dio_Helper.getData(
      url: CART,
      token: token,
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      if (kDebugMode) {
        print(cartModel!.data!.total);
      }
      emit(ShopTaskGetCartDataSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskGetCartDataErrorState(error.toString()));
    });
  }

  int quantity = 1;

  void changePlusQuantity(int index) {
    quantity = cartModel!.data!.cartItem[index].quantity!;
    if (quantity != 0) {
      quantity++;
    } else {}
    emit(ShopTaskChangeCartQuantitySuccessState());
  }

  AddCartModel? addCartModel;

  void changeCartItem(int productID) {
    emit(ShopTaskChangeCartDataLoadingState());
    if (inCart[productID] == true) {
      inCart[productID] == false;
    } else {
      inCart[productID] == true;
    }
    Dio_Helper.postData(
      url: CART,
      token: token,
      data: {
        "product_id": productID,
      },
    ).then((value) {
      addCartModel = AddCartModel.fromJSon(value.data);
      if (cartModel!.status!) {
        inCart[productID] = !inCart[productID]!;
      } else {
        getCartData();
      }
      getCartData();
      emit(ShopTaskChangeCartDataSuccessState(addCartModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskChangeCartDataErrorState(error.toString()));
    });
  }

  AddFavModel? addFavModel;

  void changeFav(productID) {
    emit(ShopTaskChangeFavDataLoadingState());

    inFav[productID] = !inFav[productID]!;

    Dio_Helper.postData(
      url: FAVORITES,
      data: {
        "product_id": productID,
      },
      token: token,
    ).then((value) {
      addFavModel = AddFavModel.fromJson(value.data);
      emit(ShopTaskChangeFavDataSuccessState(addFavModel!));
      if (favModel!.status == false) {
        inFav[productID] = !inFav[productID]!;
      } else {
        getFavData();
      }
      getFavData();
      getHomeData();
    }).catchError((error) {
      inFav[productID] = !inFav[productID]!;
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskChangeFavDataErrorState(error.toString()));
    });
  }

  FavModel? favModel;

  void getFavData() {
    emit(ShopTaskGetFavDataLoadingState());
    Dio_Helper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favModel = FavModel.fromJson(value.data);
      print(favModel!.data!.total);
      emit(ShopTaskGetFavDataSuccessState(favModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskGetFavDataErrorState(error.toString()));
    });
  }

  ProductModel? productModel;

  Future getProductData(int id) async {
    emit(ShopTaskGetProductDataLoadingState());
    Dio_Helper.getData(url: PRODUCTSDETAILS + '$id', token: token, lang: 'en')
        .then((value) {
      productModel = ProductModel.fromJson(value.data);
      print(productModel!.data!.name);
      emit(ShopTaskGetProductDataSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ShopTaskGetProductDataErrorState(error.toString()));
    });
  }

  int activeIndex = 0;
  void changeProductImage(int x) {
    activeIndex = x;
    emit(ShopChangeProductImageState());
  }
}
