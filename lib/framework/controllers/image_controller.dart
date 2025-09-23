import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageController extends Notifier<String>{
  @override
  String build() {
    return '';
  }

  void addImage(String image){
    state = image;
  }

}