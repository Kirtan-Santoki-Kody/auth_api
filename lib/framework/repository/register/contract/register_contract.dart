import 'package:auth_api/framework/repository/register/model/register_model.dart';

import '../model/register_request_model.dart';

abstract class RegisterContract {
  Future<RegisterModel> register(RegisterRequestModel model);
}
