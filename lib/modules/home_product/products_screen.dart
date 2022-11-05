import 'package:ShopTask/models/home_model.dart';
import 'package:ShopTask/modules/explore_screen/explore_screen.dart';
import 'package:ShopTask/shared/shared.components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/category_model.dart';
import '../../shared/shared.components/constants.dart';
import '../product_details/product_details.dart';

class ExclusiveOffer {
  String? image;
  String? name;
  String? details;
  String? price;

  ExclusiveOffer({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
  });
}

class BestSelling {
  String? image;
  String? name;
  String? details;
  String? price;

  BestSelling({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
  });
}

class Groceries {
  Color? color;

  Groceries({required this.color});
}

class GroceriesProduct {
  String? image;
  String? name;
  String? details;
  String? price;

  GroceriesProduct({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
  });
}

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  List<ExclusiveOffer> exclusive = [
    ExclusiveOffer(
      image: 'assets/Images/Banana.png',
      name: 'Organic Bananas',
      details: '7pcs, Price',
      price: '4.99',
    ),
    ExclusiveOffer(
      image: 'assets/Images/RedApple.png',
      name: 'Red Apple',
      details: '1kg, Price',
      price: '4.99',
    ),
    ExclusiveOffer(
      image: 'assets/Images/Banana.png',
      name: 'Red Apple',
      details: '1kg, Price',
      price: '4.99',
    ),
  ];
  List<BestSelling> bestSelling = [
    BestSelling(
      image: 'assets/Images/PrdouctFigma1.png',
      name: 'Bell Pepper Red',
      details: '1kg, Price',
      price: '4.99 ',
    ),
    BestSelling(
      image: 'assets/Images/PrdouctFigma2.png',
      name: 'Ginger',
      details: '250gm, Price',
      price: '4.99',
    ),
    BestSelling(
      image: 'assets/Images/Banana.png',
      name: 'Organic Bananas',
      details: '1kg, Price',
      price: '4.99',
    ),
  ];
  List<Groceries> groceries = [
    Groceries(
      color: HexColor('#F8A44C'),
    ),
    Groceries(
      color: HexColor('#53B190'),
    ),
  ];

  List<GroceriesProduct> groceriesProduct = [
    GroceriesProduct(
      image: 'assets/Images/Meat.png',
      name: 'Beef Bone',
      details: '1kg, Priceg',
      price: '4.99',
    ),
    GroceriesProduct(
      image: 'assets/Images/Chicken.png',
      name: 'Broiler Chicken',
      details: '1kg, Price',
      price: '4.99',
    ),
    GroceriesProduct(
      image: 'assets/Images/Banana.png',
      name: 'Red Apple',
      details: '1kg, Price',
      price: '4.99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {
        if (state is ShopTaskChangeCartDataSuccessState) {
          showToast(
              message: state.addCart.message.toString(),
              state: state.addCart.status!
                  ? ToastStates.SUCCESS
                  : ToastStates.ERROR);
        }

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
          condition: cubit.homeModel != null && cubit.categoryModel != null,
          builder: (context) => SafeArea(
            child: Scaffold(
              backgroundColor: HexColor('#FFFFFF'),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('assets/Images/icons8-carrot-48.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              color: HexColor('#393636'),
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Zag, Egypt",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: HexColor('#4C4F4D'), fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.search,
                                  color: HexColor('#181B19'), size: 20),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Search Store",
                                style: TextStyle(color: HexColor('#7C7C7C')),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      CarouselSlider(
                        items: cubit.homeModel!.data!.banners
                            .map(
                              (e) => CachedNetworkImage(
                                imageUrl: '${e.image}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        cubit.homeModel == null
                                            ? const CircularProgressIndicator()
                                            : Container(),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          scrollDirection: Axis.horizontal,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          aspectRatio: 1,
                          height: 180,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Exclusive Offer",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: HexColor('#181725'),
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                              color: HexColor('#53B175'),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 235,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                buildExclusiveOffer(
                                    cubit.homeModel!.data!.product[index],
                                    context),
                            separatorBuilder: (context, index) => Container(
                                  width: 8,
                                ),
                            itemCount: cubit.homeModel!.data!.product.length),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Best Selling",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: HexColor('#181725'),
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                              color: HexColor('#53B175'),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 235,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildBestSelling(
                                cubit.homeModel!.data!.product[index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: cubit.homeModel!.data!.product.length),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: HexColor('#181725'),
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, ExploreScreen());
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                color: HexColor('#53B175'),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => buildCategory(
                                cubit.categoryModel!.data!.data[index],
                                context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: cubit.categoryModel!.data!.data.length),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 235,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                buildGroceriesProduct(
                                    cubit.homeModel!.data!.product[index],
                                    context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: cubit.homeModel!.data!.product.length),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildExclusiveOffer(ProductsData model, BuildContext context) => model
              .discount !=
          0
      ? InkWell(
          onTap: () {
            ShopTaskCubit.get(context).getProductData(model.id).then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsTask(),
                  ));
            });
          },
          child: Container(
            height: 200,
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            //margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: "${model.image}",
                            height: 120,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    const CircularProgressIndicator(),
                          ),
                        ),
                        if (model.discount != 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            color: Colors.red,
                            child: Text(
                              "DISCOUNT",
                              style: TextStyle(
                                fontSize: 10,
                                color: HexColor('#FFFFFF'),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      model.name.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: HexColor('#181725'),
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: HexColor('#181725'),
                          size: 20,
                        ),
                        Text(
                          "${model.price}",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: HexColor('#53B175'),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: () {
                              ShopTaskCubit.get(context)
                                  .changeCartItem(model.id);
                            },
                            icon: ShopTaskCubit.get(context).inCart[model.id]!
                                ? Icon(
                                    Icons.check,
                                    color: HexColor('#FFFFFF'),
                                  )
                                : Icon(
                                    Icons.add,
                                    color: HexColor('#FFFFFF'),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                    onPressed: () {
                      ShopTaskCubit.get(context).changeFav(model.id);
                    },
                    alignment: AlignmentDirectional.topEnd,
                    icon: ShopTaskCubit.get(context).inFav[model.id]!
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
          ),
        )
      : Container();

  Widget buildBestSelling(ProductsData model, context) => InkWell(
        onTap: () {
          ShopTaskCubit.get(context).getProductData(model.id).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsTask(),
                ));
          });
        },
        child: Container(
          height: 200,
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: "${model.image}",
                      height: 120,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                  Text(
                    model.name.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: HexColor('#181725'),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: HexColor('#181725'),
                        size: 20,
                      ),
                      Text(
                        "${model.price}",
                        style: TextStyle(
                          color: HexColor('#181725'),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor('#53B175'),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            ShopTaskCubit.get(context).changeCartItem(model.id);
                          },
                          icon: ShopTaskCubit.get(context).inCart[model.id]!
                              ? Icon(
                                  Icons.check,
                                  color: HexColor('#FFFFFF'),
                                )
                              : Icon(
                                  Icons.add,
                                  color: HexColor('#FFFFFF'),
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                  onPressed: () {
                    ShopTaskCubit.get(context).changeFav(model.id);
                  },
                  alignment: AlignmentDirectional.topEnd,
                  icon: ShopTaskCubit.get(context).inFav[model.id]!
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
        ),
      );

  Widget buildCategory(
    DataForCategory model,
    BuildContext context,
  ) =>
      Container(
        height: 80,
        width: 240,
        //HexColor('#F8A44C') HexColor('#53B190')
        decoration: BoxDecoration(
          color: HexColor('#53B175'),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${model.image}',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${model.name}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor('#FFFFFF'),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ],
        ),
      );

  Widget buildGroceriesProduct(ProductsData model, context) => InkWell(
        onTap: () {
          ShopTaskCubit.get(context).getProductData(model.id).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsTask(),
                ));
          });
        },
        child: Container(
          height: 200,
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: "${model.image}",
                      height: 120,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                  Text(
                    model.name.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: HexColor('#181725'),
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: HexColor('#181725'),
                        size: 20,
                      ),
                      Text(
                        "${model.price}",
                        style: TextStyle(
                          color: HexColor('#181725'),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor('#53B175'),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            ShopTaskCubit.get(context).changeCartItem(model.id);
                          },
                          icon: ShopTaskCubit.get(context).inCart[model.id]!
                              ? Icon(
                                  Icons.check,
                                  color: HexColor('#FFFFFF'),
                                )
                              : Icon(
                                  Icons.add,
                                  color: HexColor('#FFFFFF'),
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                  onPressed: () {
                    ShopTaskCubit.get(context).changeFav(model.id);
                  },
                  alignment: AlignmentDirectional.topEnd,
                  icon: ShopTaskCubit.get(context).inFav[model.id]!
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
        ),
      );
}
