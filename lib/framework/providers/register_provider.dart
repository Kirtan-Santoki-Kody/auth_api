import 'package:auth_api/framework/controllers/register_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = NotifierProvider<RegisterController, DateTime>(
  RegisterController.new,
);
