import 'package:auth_api/framework/controllers/login_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = NotifierProvider<LoginController, void>(
  LoginController.new,
);
