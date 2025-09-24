import 'package:auth_api/framework/repository/register/model/register_error_model.dart';
import 'package:dio/dio.dart';

class MyDioExceptions {
  String? exceptions(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      return RegisterErrorModel.fromJson(e.response?.data).message;
    }else if(e.type == DioExceptionType.connectionError){
      return RegisterErrorModel(message: 'Can\'t connect with server please try again after some time').message;
    }else if(e.type == DioExceptionType.connectionTimeout){
      return RegisterErrorModel(message: 'Can\'t connect with server please try again').message;
    }else {
      return RegisterErrorModel(message: 'Something went wrong. Please try again').message;
    }
  }
}
