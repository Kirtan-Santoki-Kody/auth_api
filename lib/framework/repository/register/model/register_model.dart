import 'package:auth_api/framework/repository/register/model/data_model.dart';

class RegisterModel {
  bool? success;
  String? message;
  DataModel? data;
  DateTime? timestamp;

  RegisterModel({this.success, this.message, this.data, this.timestamp});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
    timestamp: json["timestamp"] == null
        ? null
        : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "timestamp": timestamp?.toIso8601String(),
  };
}
