import 'dart:async';

import 'package:auth_api/framework/repository/profile/model/profile_model.dart';
import 'package:auth_api/framework/repository/profile/repository/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileController extends AsyncNotifier<ProfileModel>{

  Future<void> getProfile() async {
    state = AsyncValue.loading();
    try {
      var data = await ProfileRepo().getProfile();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  @override
  FutureOr<ProfileModel> build() async {
    var data = await ProfileRepo().getProfile();
    return data;
  }

}