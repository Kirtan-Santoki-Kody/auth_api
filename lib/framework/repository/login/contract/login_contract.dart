import 'package:auth_api/framework/repository/login/model/login_model.dart';
import 'package:auth_api/framework/repository/login/model/login_request_model.dart';

abstract class LoginContract{
  Future<LoginModel> login(LoginRequestModel model);
}