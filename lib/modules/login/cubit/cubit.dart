import 'package:ShopTask/models/user_model.dart';
import 'package:ShopTask/modules/login/cubit/states.dart';
import 'package:ShopTask/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;
  void getUserData({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    Dio_Helper.postData(
      url: LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      loginModel = UserModel.fromJson(value.data);
      print(value.data);
      print(loginModel!.data!.token);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  bool passwordShow = true;
  void changePasswordVisibility() {
    passwordShow = !passwordShow;
    emit(LoginChangePasswordVisibilityState());
  }
}
