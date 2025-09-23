import 'package:auth_api/framework/providers/network/api_endpoints/api_endpoints.dart';
import 'package:auth_api/framework/providers/network/dio/dio_client.dart';
import 'package:auth_api/framework/repository/register/contract/register_contract.dart';
import 'package:auth_api/framework/repository/register/model/register_model.dart';
import 'package:auth_api/framework/repository/register/model/register_request_model.dart';
import 'package:auth_api/framework/repository/register/model/token_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class RegisterRepo implements RegisterContract {
  DioClient dioClient = DioClient();
  final box = Hive.box<TokensModel>('auth_tokens');

  @override
  Future<RegisterModel> register(RegisterRequestModel model) async {
    try {
      var response = await dioClient.post(
        ApiEndpoints.register,
        model.toJson(),
        null,
      );
      if(response.statusCode == 201){
        box.put(
          'token',
          RegisterModel.fromJson(response.data).data?.tokens ?? TokensModel(),
        );
        return RegisterModel.fromJson(response.data);
      }else{
        return RegisterModel();
      }

    } on DioException catch (e) {
      print(e);
      rethrow;
    }
  }
}
