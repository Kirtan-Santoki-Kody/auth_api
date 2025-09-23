import 'dart:async';

import 'package:auth_api/framework/repository/profile/model/logout_model.dart';
import 'package:auth_api/framework/repository/profile/repository/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutController extends AsyncNotifier<LogoutModel> {
  @override
  FutureOr<LogoutModel> build() async {
    return LogoutModel();
  }

  Future<void> logout() async {
    state = AsyncValue.loading();
    try {
      state = AsyncValue.data(await ProfileRepo().logout());
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
