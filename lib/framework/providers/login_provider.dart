import 'package:auth_api/framework/controllers/login_controller.dart';
import 'package:auth_api/framework/repository/login/model/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = AsyncNotifierProvider<LoginController, LoginModel>(
  LoginController.new,
);
