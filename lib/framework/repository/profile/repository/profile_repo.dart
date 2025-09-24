import 'package:auth_api/framework/providers/network/api_endpoints/api_endpoints.dart';
import 'package:auth_api/framework/providers/network/dio/dio_client.dart';
import 'package:auth_api/framework/repository/profile/contract/profile_contract.dart';
import 'package:auth_api/framework/repository/profile/model/logout_model.dart';
import 'package:auth_api/framework/repository/profile/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../providers/network/dio_exception/dio_exception.dart';
import '../../register/model/register_error_model.dart';
import '../../register/model/token_model.dart';

class ProfileRepo implements ProfileContract {
  DioClient dioClient = DioClient();
  final box = Hive.box<TokensModel>('auth_tokens');

  @override
  Future<ProfileModel> getProfile() async {
    try {
      var response = await dioClient.get(ApiEndpoints.getProfile, null, {
        'Authorization': 'Bearer ${box.get('token')?.accessToken}',
      });

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception(RegisterErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      throw Exception(MyDioExceptions().exceptions(e));
    }
  }

  @override
  Future<LogoutModel> logout() async {
    try {
      var response = await dioClient.post(
        ApiEndpoints.logout,
        {"refresh_token": box.get('token')?.refreshToken},
        {'Authorization': 'Bearer ${box.get('token')?.accessToken}'},
      );

      if (response.statusCode == 200) {
        await box.delete('token');
        return LogoutModel.fromJson(response.data);
      } else {
        throw Exception(RegisterErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      throw Exception(MyDioExceptions().exceptions(e));
    }
  }
}
