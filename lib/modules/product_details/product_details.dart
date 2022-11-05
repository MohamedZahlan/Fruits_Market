import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/cubit/states.dart';
import 'package:ShopTask/models/product_det_model.dart';
import 'package:ShopTask/shared/network/shared.styles/colors.dart';
import 'package:ShopTask/shared/shared.components/components.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/shared.components/constants.dart';

class ProductDetailsTask extends StatelessWidget {
  const ProductDetailsTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.productModel != null,
          builder: (context) => Scaffold(
            backgroundColor: HexColor('#FFFFFF'),
            appBar: AppBar(
              backgroundColor: HexColor('#FFFFFF'),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: HexColor('#181725'),
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.ios_share_sharp,
                      color: HexColor('#181725'),
                    )),
              ],
            ),
            bottomNavigationBar: cubit.productModel!.data != null
                ? defaultButton(
                    text: cubit.inCart[cubit.productModel!.data!.id]!
                        ? "Added"
                        : "Add To Basket",
                    color: HexColor('#FFF9FF'),
                    function: () {
                      ShopTaskCubit.get(context)
                          .changeCartItem(cubit.productModel!.data!.id!);
                    },
                  )
                : Container(
                    color: Colors.white,
                  ),
            body: cubit.productModel != null
                ? buildProductDetailsItem(cubit.productModel!.data!, context)
                : const Center(child: CircularProgressIndicator()),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildProductDetailsItem(ProductData data, context) {
    List<Widget> images = [];
    data.images.forEach((element) {
      images.add(
        Image.network(
          element,
        ),
      );
    });
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Center(
                  child: CarouselSlider(
                    items: images,
                    options: CarouselOptions(
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                      reverse: false,
                      autoPlay: false,
                      onPageChanged: (int x, reason) {
                        ShopTaskCubit.get(context).changeProductImage(x);
                      },
                    ),
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: ShopTaskCubit.get(context).activeIndex,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: myDefaultColor,
                    dotHeight: 10,
                    dotWidth: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${data.name}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: HexColor('#181725'),
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: HexColor('#181725'),
                    ),
                    Text(
                      "${data.price}",
                      style: TextStyle(
                        color: HexColor('#181725'),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade300,
                      child: IconButton(
                        onPressed: () {
                          ShopTaskCubit.get(context).changeFav(data.id);
                        },
                        alignment: AlignmentDirectional.topEnd,
                        icon: ShopTaskCubit.get(context).inFav[data.id]!
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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ExpansionTile(
                        title: Text(
                          "Product Detail",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              '${data.description}',
                              style: TextStyle(
                                color: HexColor('#181725'),
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Nutritions",
                      style: TextStyle(
                        color: HexColor('#181725'),
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      color: HexColor('#EBEBEB'),
                      child: Text(
                        "100gr",
                        style: TextStyle(
                          color: HexColor('#7C7C7C'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: HexColor('#181725'),
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Review",
                      style: TextStyle(
                        color: HexColor('#181725'),
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: HexColor('#F3603F'),
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: HexColor('#F3603F'),
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: HexColor('#F3603F'),
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: HexColor('#F3603F'),
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: HexColor('#F3603F'),
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: HexColor('#181725'),
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
