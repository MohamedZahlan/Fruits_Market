import 'package:ShopTask/layout/cubit/cubit.dart';
import 'package:ShopTask/layout/shop_home.dart';
import 'package:ShopTask/modules/login/cubit/cubit.dart';
import 'package:ShopTask/modules/login/cubit/states.dart';
import 'package:ShopTask/shared/network/local/cache_helper.dart';
import 'package:ShopTask/shared/shared.components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/shared.components/constants.dart';
import '../register/signup_screen.dart';

class LoginScreenTask extends StatelessWidget {
  LoginScreenTask({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
              message: state.userModel.message.toString(),
              state: state.userModel.status!
                  ? ToastStates.SUCCESS
                  : ToastStates.ERROR,
            );
            CacheHelper.saveData(
                    key: 'token', value: state.userModel.data!.token)
                .then((value) {
              token = state.userModel.data!.token;
              ShopTaskCubit.get(context).currentIndex = 0;
              if (value) {
                navigateFinish(context , const ShopTaskLayout());
              }
            });
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: HexColor('#FCFCFC'),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage(
                                'assets/Images/icons8-carrot-48.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 110,
                        ),
                        Text(
                          "Loging",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: HexColor('#181725'), fontSize: 30),
                        ),
                        Text(
                          "Enter your emails and password",
                          style: TextStyle(
                              color: HexColor('#7C7C7C'), fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changePasswordVisibility();
                              },
                              icon: Icon(cubit.passwordShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          obscureText: cubit.passwordShow,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 220, top: 10),
                          child: Text(
                            "Forget Password?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: HexColor('#181725'), fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: HexColor('#53B175'),
                                borderRadius: BorderRadius.circular(15)),
                            child: MaterialButton(
                              onPressed: () {
                                cubit.getUserData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: HexColor('#FFF9FF'),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: HexColor('#181725')),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ));
                              },
                              child: Text(
                                "Signup ",
                                style: TextStyle(color: HexColor('#53B175')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
