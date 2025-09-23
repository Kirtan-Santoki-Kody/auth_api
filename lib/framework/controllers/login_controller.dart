import 'package:auth_api/framework/repository/login/model/login_model.dart';
import 'package:auth_api/framework/repository/login/model/login_request_model.dart';
import 'package:auth_api/framework/repository/login/repository/login_repo.dart';
import 'package:auth_api/framework/utils/ui_states/ui_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends Notifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UIState<LoginModel> loginState = UIState();

  Future<void> login() async {
    loginState.isLoading = true;
    updateShouldNotify(state, state);
    loginState.success = await LoginRepo().login(
      LoginRequestModel(
        identifier: emailController.text,
        password: passwordController.text,
      ),
    );
    Future.delayed(Duration(seconds: 2));
    loginState.isLoading = false;
    updateShouldNotify(state, state);
    print(loginState.success?.data?.message);
  }

  @override
  build() {
    return;
  }
}
