import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopTaskLayout extends StatelessWidget {
  const ShopTaskLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopTaskCubit, ShopTaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopTaskCubit cubit = ShopTaskCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.bottomNav,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
