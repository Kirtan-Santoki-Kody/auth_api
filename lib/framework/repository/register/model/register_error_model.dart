class RegisterErrorModel {
  bool? success;
  String? message;
  DateTime? timestamp;
  dynamic errors;

  RegisterErrorModel({this.success, this.message, this.timestamp, this.errors});

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) =>
      RegisterErrorModel(
        success: json["success"],
        message: json["message"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "timestamp": timestamp?.toIso8601String(),
    "errors": errors,
  };
}
