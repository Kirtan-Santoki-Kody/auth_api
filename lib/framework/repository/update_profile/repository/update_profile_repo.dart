import 'package:auth_api/framework/providers/network/api_endpoints/api_endpoints.dart';
import 'package:auth_api/framework/providers/network/dio/dio_client.dart';
import 'package:auth_api/framework/repository/update_profile/contract/update_profile_contract.dart';
import 'package:auth_api/framework/repository/update_profile/model/update_profile_model.dart';
import 'package:auth_api/framework/repository/update_profile/model/update_profile_request_model.dart';
import 'package:auth_api/framework/repository/update_profile/model/upload_image_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../providers/network/dio_exception/dio_exception.dart';
import '../../register/model/register_error_model.dart';
import '../../register/model/token_model.dart';

class UpdateProfileRepo implements UpdateProfileContract {
  DioClient dioClient = DioClient();
  final box = Hive.box<TokensModel>('auth_tokens');

  @override
  Future<UpdateProfileModel> updateProfile(
    UpdateProfileRequestModel model,
  ) async {
    try {
      var response = await dioClient.put(
        ApiEndpoints.updateProfile,
        model.toJson(),
        {'Authorization': 'Bearer ${box.get('token')?.accessToken}'},
      );

      if (response.statusCode == 200) {
        return UpdateProfileModel.fromJson(response.data);
      } else {
        throw Exception(RegisterErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      throw Exception(MyDioExceptions().exceptions(e));
    }
  }

  @override
  Future<UploadImageModel> uploadImage(String image) async {
    try {
      var response = await dioClient.postFormData(
        ApiEndpoints.updateProfileImage,
        {'profile_image': await MultipartFile.fromFile(image)},
        {'Authorization': 'Bearer ${box.get('token')?.accessToken}'},
      );

      if (response.statusCode == 200) {
        return UploadImageModel.fromJson(response.data);
      } else {
        throw Exception(RegisterErrorModel.fromJson(response.data));
      }
    } on DioException catch (e) {
      throw Exception(MyDioExceptions().exceptions(e));
    }
  }
}
