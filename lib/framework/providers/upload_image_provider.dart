import 'package:auth_api/framework/controllers/upload_image_controller.dart';
import 'package:auth_api/framework/repository/update_profile/model/upload_image_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadImageProvider =
    AsyncNotifierProvider<UploadImageController, UploadImageModel>(
      UploadImageController.new,
    );
