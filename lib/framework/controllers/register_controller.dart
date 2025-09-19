import 'package:auth_api/framework/repository/register/model/register_request_model.dart';
import 'package:auth_api/framework/repository/register/repository/register_repo.dart';
import 'package:auth_api/framework/utils/ui_states/ui_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterController extends Notifier<DateTime> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  DateTime birthDate = DateTime.now();

  UIState registerState = UIState();

  @override
  DateTime build() {
    return birthDate;
  }

  void updateDate(DateTime date){
    state = date;
  }

  Future<void> register() async {
    registerState.isLoading = true;
    await RegisterRepo().register(
      RegisterRequestModel(
        confirmPassword: confirmPassword.text,
        dateOfBirth: state,
        email: email.text,
        firstName: firstName.text,
        lastName: lastName.text,
        password: password.text,
        phone: phone.text,
        username: userName.text,
      ),
    );
    registerState.isLoading = false;
  }
}
