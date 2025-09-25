import 'dart:async';

import 'package:auth_api/framework/repository/login/model/login_model.dart';
import 'package:auth_api/framework/repository/login/model/login_request_model.dart';
import 'package:auth_api/framework/repository/login/repository/login_repo.dart';
import 'package:auth_api/ui/screens/profile_screen.dart';
import 'package:auth_api/ui/utils/global_keys/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends AsyncNotifier<LoginModel> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // UIState<LoginModel> loginState = UIState();

  Future<void> login() async {
    state = AsyncValue.loading();
    try {
      var data = await LoginRepo().login(
        LoginRequestModel(
          identifier: emailController.text,
          password: passwordController.text,
        ),
      );
      GlobalNavigatorKey.navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
      emailController.clear();
      passwordController.clear();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  @override
  FutureOr<LoginModel> build() {
    return LoginModel();
  }
}
