import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/cubit/states.dart';
import 'package:ShopTask/modules/login/login_screen.dart';
import 'package:ShopTask/shared/network/local/cache_helper.dart';
import 'package:ShopTask/shared/shared.components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/Images/ProfileImage.jfif')),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Afsar Hossen",
                                  style: TextStyle(
                                    color: HexColor('#181725'),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  alignment: AlignmentDirectional.bottomStart,
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    size: 20,
                                  ),
                                  color: HexColor('#53B175'),
                                ),
                              ],
                            ),
                            Text(
                              "Imshuvo97@gmail.com",
                              style: TextStyle(
                                color: HexColor('#7C7C7C'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 25),
                    Row(
                      children: [
                        const Icon(Icons.shopping_basket_outlined),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Orders",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.addressCard),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "My Details",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Delivery Address",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.payment,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Payment Methods",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_offer_outlined,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Promo Cord",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.help_outline,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Help",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "About ",
                          style: TextStyle(
                            color: HexColor('#181725'),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    myDivider(horizontal: 0.0, vertical: 13),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        CacheHelper.removeData(key: 'token').then((value) {
                          navigateFinish(context, LoginScreenTask());
                        });
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: HexColor('#53B175'),
                              size: 30,
                            ),
                            const SizedBox(
                              width: 90,
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                color: HexColor('#53B175'),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
