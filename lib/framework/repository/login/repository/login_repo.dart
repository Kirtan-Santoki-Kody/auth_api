import 'package:auth_api/framework/providers/network/api_endpoints/api_endpoints.dart';
import 'package:auth_api/framework/providers/network/dio/dio_client.dart';
import 'package:auth_api/framework/providers/network/dio_exception/dio_exception.dart';
import 'package:auth_api/framework/repository/login/contract/login_contract.dart';
import 'package:auth_api/framework/repository/login/model/login_model.dart';
import 'package:auth_api/framework/repository/login/model/login_request_model.dart';
import 'package:auth_api/framework/repository/register/model/register_error_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../register/model/token_model.dart';

class LoginRepo implements LoginContract {
  DioClient dioClient = DioClient();
  final box = Hive.box<TokensModel>('auth_tokens');

  @override
  Future<LoginModel> login(LoginRequestModel model) async {
    try {
      var response = await dioClient.post(
        ApiEndpoints.login,
        model.toJson(),
        null,
      );

      if (response.statusCode == 200) {
        box.put(
          'token',
          LoginModel.fromJson(response.data).data?.tokens ?? TokensModel(),
        );
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception(RegisterErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      throw Exception(MyDioExceptions().exceptions(e));
    }
  }
}
