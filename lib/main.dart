import 'package:ShopTask/layout/shop_home.dart';
import 'package:ShopTask/modules/explore_screen/explore_screen.dart';
import 'package:ShopTask/modules/splash_screen/splash_screen.dart';
import 'package:ShopTask/shared/network/local/cache_helper.dart';
import 'package:ShopTask/shared/network/remote/dio_helper.dart';
import 'package:ShopTask/shared/network/shared.styles/themes.dart';
import 'package:ShopTask/shared/shared.components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dio_Helper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  runApp(const MyApp());
  print(token);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopTaskCubit()
        ..getHomeData()
        ..getCategoryData()
        ..getCartData()
        ..getFavData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: token != null ? const ShopTaskLayout() : const SplashScreen(),
      ),
    );
  }
}
