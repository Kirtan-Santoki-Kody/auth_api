import 'dart:async';

import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/framework/repository/register/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/screens/profile_screen.dart';
import '../../ui/utils/global_keys/navigator_key.dart';
import '../repository/register/model/register_request_model.dart';
import '../repository/register/repository/register_repo.dart';

class RegisterAsyncController extends AsyncNotifier<RegisterModel> {
  @override
  FutureOr<RegisterModel> build() {
    return RegisterModel();
  }

  Future<void> register() async {
    state = AsyncValue.loading();
    try {
      var register = ref.read(registerProvider.notifier);
      var data = await RegisterRepo().register(
        RegisterRequestModel(
          confirmPassword: register.confirmPassword.text,
          dateOfBirth: ref.watch(registerProvider),
          email: register.email.text,
          firstName: register.firstName.text,
          lastName: register.lastName.text,
          password: register.password.text,
          phone: register.phone.text,
          username: register.userName.text,
        ),
      );
      GlobalNavigatorKey.navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
      register.email.clear();
      register.phone.clear();
      register.lastName.clear();
      register.firstName.clear();
      register.confirmPassword.clear();
      register.password.clear();
      register.userName.clear();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
