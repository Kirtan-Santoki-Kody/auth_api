import 'dart:async';

import 'package:auth_api/framework/providers/profile_provider.dart';
import 'package:auth_api/framework/providers/register_provider.dart';
import 'package:auth_api/framework/repository/update_profile/model/update_profile_model.dart';
import 'package:auth_api/framework/repository/update_profile/model/update_profile_request_model.dart';
import 'package:auth_api/framework/repository/update_profile/repository/update_profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateProfileController extends AsyncNotifier<UpdateProfileModel> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;

  @override
  FutureOr<UpdateProfileModel> build() {
    controllerInit();
    return UpdateProfileModel();
  }

  void controllerInit() {
    firstNameController = TextEditingController(
      text: ref.read(profileProvider).value?.data?.user?.firstName,
    );
    lastNameController = TextEditingController(
      text: ref.read(profileProvider).value?.data?.user?.lastName,
    );
    phoneController = TextEditingController(
      text: ref.read(profileProvider).value?.data?.user?.phone,
    );
  }

  Future<void> updateProfile() async {
    state = AsyncValue.loading();
    try {
      var data = await UpdateProfileRepo().updateProfile(
        UpdateProfileRequestModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phone: phoneController.text,
          dateOfBirth: ref.watch(registerProvider),
        ),
      );
      state = AsyncValue.data(data);
      ref.read(profileProvider.notifier).getProfile();
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
