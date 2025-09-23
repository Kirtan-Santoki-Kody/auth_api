import 'dart:async';

import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/framework/repository/register/model/register_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
