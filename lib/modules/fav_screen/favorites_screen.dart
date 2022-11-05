import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/cubit/states.dart';
import 'package:ShopTask/models/fav_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/shared.components/components.dart';
import '../product_details/product_details.dart';

class FavItem {
  String? image;
  String? title;
  String? bio;
  String? price;

  FavItem({
    required this.image,
    required this.title,
    required this.bio,
    required this.price,
  });
}

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);

  final List<FavItem> fav = [
    FavItem(
      image: 'assets/Images/sprite.png',
      title: 'Sprite Can',
      bio: '325ml, Price',
      price: '1.50',
    ),
    FavItem(
      image: 'assets/Images/colaDiet.png',
      title: 'Diet Coke',
      bio: '355ml, Price',
      price: '1.99',
    ),
    FavItem(
      image: 'assets/Images/juice-apple.png',
      title: 'Apple & Grape Juice',
      bio: '2L, Price',
      price: '15.50',
    ),
    FavItem(
      image: 'assets/Images/cola.png',
      title: 'Coca Cola Can',
      bio: '325ml, Price',
      price: '4.99',
    ),
    FavItem(
      image: 'assets/Images/pepsi.png',
      title: 'Pepsi Can ',
      bio: '330ml, Price',
      price: '4.99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {
        if (state is ShopTaskChangeFavDataSuccessState) {
          showToast(
              message: state.addFav.message.toString(),
              state: state.addFav.status!
                  ? ToastStates.SUCCESS
                  : ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return ConditionalBuilder(
          condition: state is! ShopTaskGetFavDataLoadingState &&
              cubit.favModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Favorite",
              ),
              elevation: 0.3,
            ),
            bottomNavigationBar: defaultButton(
              text: "Add All to Cart",
              color: HexColor('#FFF9FF'),
            ),
            body: cubit.favModel!.data!.total != 0
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        print('hi');
                      },
                      child: buildFavItem(
                          cubit.favModel!.data!.data[index], context),
                    ),
                    separatorBuilder: (context, index) =>
                        myDivider(horizontal: 20, vertical: 15),
                    itemCount: cubit.favModel!.data!.data.length,
                  )
                : Center(
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/Images/Boarding.png'),
                          height: 400,
                        ),
                        Text(
                          "Favorites are empty!",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              //height: MediaQuery.of(context).size.shortestSide,
                              ),
                        ),
                      ],
                    ),
                  ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItem(DataForFav model, context) => InkWell(
        onTap: () {
          ShopTaskCubit.get(context)
              .getProductData(model.product!.id!)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsTask(),
                ));
          });
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${model.product?.image}',
                height: 100,
                width: 90,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${model.product?.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: HexColor('#181725'),
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: HexColor('#53B175'),
                          size: 20,
                        ),
                        Text(
                          "${model.product?.price}",
                          style: TextStyle(
                            color: HexColor('#53B175'),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {
                              ShopTaskCubit.get(context)
                                  .changeFav(model.product!.id);
                            },
                            alignment: AlignmentDirectional.topEnd,
                            icon: ShopTaskCubit.get(context)
                                    .inFav[model.product!.id]!
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: HexColor('#181725'),
                size: 20,
              ),
            ],
          ),
        ),
      );
}
