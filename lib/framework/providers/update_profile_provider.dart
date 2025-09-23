import 'package:auth_api/framework/controllers/update_profile_controller.dart';
import 'package:auth_api/framework/repository/update_profile/model/update_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateProfileProvider =
    AsyncNotifierProvider<UpdateProfileController, UpdateProfileModel>(
      UpdateProfileController.new,
    );
