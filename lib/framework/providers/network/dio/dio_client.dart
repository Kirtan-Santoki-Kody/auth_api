import 'package:auth_api/framework/providers/network/api_endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final dio = Dio(
    BaseOptions(baseUrl: ApiEndpoints.baseUrl, contentType: 'application/json'),
  );

  DioClient() {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(
    String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  ) async {
    final response = await dio.get(
      endpoint,
      queryParameters: query,
      options: Options(headers: header),
    );
    return response;
  }

  Future<Response> delete(
    String endpoint,
    Map<String, dynamic> body,
    Map<String, dynamic>? header,
  ) async {
    final response = await dio.delete(
      endpoint,
      data: body,
      options: Options(headers: header),
    );
    return response;
  }

  Future<Response> post(
    String endpoint,
    Map<String, dynamic> body,
    Map<String, dynamic>? header,
  ) async {
    final response = await dio.post(
      endpoint,
      data: body,
      options: Options(headers: header),
    );
    return response;
  }

  Future<Response> postFormData(String endpoint,
      Map<String, MultipartFile> body,
      Map<String, dynamic>? header,)async{
    final response = await dio.post(
      endpoint,
      data: FormData.fromMap(body),
      options: Options(headers: header),
    );
    return response;
  }

  Future<Response> put(
      String endpoint,
      Map<String, dynamic> body,
      Map<String, dynamic>? header,
      ) async {
    final response = await dio.put(
      endpoint,
      data: body,
      options: Options(headers: header),
    );
    return response;
  }
}
