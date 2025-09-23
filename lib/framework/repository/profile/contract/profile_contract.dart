import 'package:auth_api/framework/repository/profile/model/logout_model.dart';
import 'package:auth_api/framework/repository/profile/model/profile_model.dart';

abstract class ProfileContract{
  Future<ProfileModel> getProfile();

  Future<LogoutModel> logout();
}