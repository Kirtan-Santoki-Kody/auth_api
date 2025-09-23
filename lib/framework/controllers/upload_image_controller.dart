import 'dart:async';

import 'package:auth_api/framework/providers/image_provider.dart';
import 'package:auth_api/framework/repository/update_profile/model/upload_image_model.dart';
import 'package:auth_api/framework/repository/update_profile/repository/update_profile_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_provider.dart';

class UploadImageController extends AsyncNotifier<UploadImageModel> {
  @override
  FutureOr<UploadImageModel> build() {
    return UploadImageModel();
  }

  Future<void> uploadImage() async {
    state = AsyncValue.loading();
    try {
      var data = await UpdateProfileRepo().uploadImage(
        ref.watch(imageProvider),
      );
      state = AsyncValue.data(data);
      ref.read(profileProvider.notifier).getProfile();
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
