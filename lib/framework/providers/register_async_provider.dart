import 'package:auth_api/framework/controllers/register_async_controller.dart';
import 'package:auth_api/framework/repository/register/model/register_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerAsyncProvider =
    AsyncNotifierProvider<RegisterAsyncController, RegisterModel>(
      RegisterAsyncController.new,
    );
