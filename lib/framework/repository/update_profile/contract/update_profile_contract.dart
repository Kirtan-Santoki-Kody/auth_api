import 'package:auth_api/framework/repository/update_profile/model/update_profile_model.dart';
import 'package:auth_api/framework/repository/update_profile/model/upload_image_model.dart';

import '../model/update_profile_request_model.dart';

abstract class UpdateProfileContract {
  Future<UpdateProfileModel> updateProfile(UpdateProfileRequestModel model);

  Future<UploadImageModel> uploadImage(String image);
}
