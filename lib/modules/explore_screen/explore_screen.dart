import 'package:ShopTask/layout/cubit/states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../layout/cubit/cubit.dart';
import '../../models/category_model.dart';

class Products {
  String? name;
  String? image;
  Color? color;

  Products({
    required this.name,
    required this.image,
    required this.color,
  });
}

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  List<Products> product = [
    Products(
      name: "Frash Fruits & Vegetable",
      image: 'assets/Images/Vegetable.png',
      color: HexColor('#53B199'),
    ),
    Products(
      name: "Cooking Oil & Ghee",
      image: 'assets/Images/Cooking-Oil.png',
      color: HexColor('#FDE598'),
    ),
    Products(
      name: "Meat & Fish",
      image: 'assets/Images/Meat&Fish.png',
      color: HexColor('#F7A599'),
    ),
    Products(
      name: "Bakery & Snacks",
      image: 'assets/Images/Bakery&Snacks.png',
      color: HexColor('#D3B0E0'),
    ),
    Products(
      name: "Dairy & Eggs",
      image: 'assets/Images/Dairy&Eggs.png',
      color: HexColor('#FDE598'),
    ),
    Products(
      name: "Beverages",
      image: 'assets/Images/Beverages.png',
      color: HexColor('#B7DFF5'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.categoryModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Find Products",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: InkWell(
                      onTap: () {},
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
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1 / 1.2,
                      children: List.generate(
                        cubit.categoryModel!.data!.data.length,
                        (index) => buildCategoryItem(
                            cubit.categoryModel!.data!.data[index], context),
                      ),
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

  Widget buildCategoryItem(
    DataForCategory model,
    BuildContext context,
  ) =>
      Container(
        height: 50,
        width: 100,
        //HexColor('#F8A44C') HexColor('#53B190')
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
        decoration: BoxDecoration(
          color: HexColor('#53B175'),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${model.image}',
              height: 135,
              width: double.infinity,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator(),
            ),
            const Spacer(),
            Text(
              '${model.name}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor('#FFFFFF'),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ],
        ),
      );
}
