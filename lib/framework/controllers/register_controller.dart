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

  @override
  DateTime build() {
    return birthDate;
  }

  void updateDate(DateTime date){
    state = date;
  }
}
