import 'package:auth_api/framework/controllers/profile_controller.dart';
import 'package:auth_api/framework/repository/profile/model/profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = AsyncNotifierProvider<ProfileController, ProfileModel>(
  ProfileController.new,
);
