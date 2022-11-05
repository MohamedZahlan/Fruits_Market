import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/cubit/states.dart';
import 'package:ShopTask/models/cart_model.dart';
import 'package:ShopTask/shared/shared.components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/network/shared.styles/colors.dart';
import '../product_details/product_details.dart';

class CartItem {
  String? image;
  String? title;
  String? bio;
  String? price;

  CartItem({
    required this.image,
    required this.title,
    required this.bio,
    required this.price,
  });
}

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final List<CartItem> cartList = [
    CartItem(
      image: 'assets/Images/PrdouctFigma1.png',
      title: 'Bell Pepper Red',
      bio: '1kg, Price',
      price: '4.99',
    ),
    CartItem(
      image: 'assets/Images/egg.png',
      title: 'Egg Chicken Red',
      bio: '4pcs, Price',
      price: '1.99',
    ),
    CartItem(
      image: 'assets/Images/Banana.png',
      title: 'Organic Bananas',
      bio: '12kg, Price',
      price: '3.00',
    ),
    CartItem(
      image: 'assets/Images/PrdouctFigma2.png',
      title: 'Ginger',
      bio: '250gm, Price',
      price: '2.99',
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
      },
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "My Cart",
            ),
            elevation: 0.3,
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      "Total Price:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${cubit.cartModel!.data!.total}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: myColor,
                      ),
                    ),
                    Icon(
                      Icons.attach_money_sharp,
                      color: myColor,
                    ),
                  ],
                ),
              ),
              defaultButton(text: "Go to Checkout", color: HexColor('#FFF9FF')),
            ],
          ),
          body: cubit.cartModel!.data!.cartItem.isEmpty
              ? Center(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/Images/CartEmpty.png'),
                        height: 350,
                      ),
                      Text(
                        'Cart is Empty!',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildCartItem(
                    cubit.cartModel!.data!.cartItem[index],
                    context,
                    index,
                  ),
                  separatorBuilder: (context, index) =>
                      myDivider(horizontal: 20, vertical: 15),
                  itemCount: cubit.cartModel!.data!.cartItem.length,
                ),
        );
      },
    );
  }

  Widget buildCartItem(CartItems cartItem, context, index) => InkWell(
        onTap: () {
          ShopTaskCubit.get(context)
              .getProductData(cartItem.product!.id!)
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsTask(),
                ));
          });
        },
        child: Container(
          height: 140,
          margin: const EdgeInsets.only(
            top: 10,
            right: 5,
            left: 5,
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${cartItem.product!.image}',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Text(
                            '${cartItem.product!.name}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: HexColor('#181725'),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        IconButton(
                          onPressed: () {
                            ShopTaskCubit.get(context)
                                .changeCartItem(cartItem.product!.id!);
                          },
                          icon: const Icon(Icons.close),
                          color: HexColor('#B3B3B3'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.minimize_sharp,
                            color: HexColor('#B3B3B3'),
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            //cartItem.quantity
                            "${cartItem.quantity}",
                            style: TextStyle(
                              color: HexColor('#181725'),
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: IconButton(
                            onPressed: () {
                              ShopTaskCubit.get(context)
                                  .changePlusQuantity(index);
                            },
                            icon: Icon(Icons.add,
                                color: HexColor('#53B175'), size: 30),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.attach_money,
                          color: HexColor('#53B175'),
                          size: 20,
                        ),
                        Text(
                          "${cartItem.product!.price}",
                          style: TextStyle(
                            color: HexColor('#53B175'),
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
