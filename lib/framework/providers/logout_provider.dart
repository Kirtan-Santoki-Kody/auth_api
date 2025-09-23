import 'package:auth_api/framework/controllers/logout_controller.dart';
import 'package:auth_api/framework/repository/profile/model/logout_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logOutProvider = AsyncNotifierProvider<LogoutController, LogoutModel>(
  LogoutController.new,
);
