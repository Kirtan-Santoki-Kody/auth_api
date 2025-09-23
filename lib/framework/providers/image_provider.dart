import 'package:auth_api/framework/controllers/image_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = NotifierProvider<ImageController, String>(
  ImageController.new,
);
