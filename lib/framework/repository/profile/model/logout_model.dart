class LogoutModel {
  bool? success;
  String? message;
  Data? data;
  DateTime? timestamp;

  LogoutModel({this.success, this.message, this.data, this.timestamp});

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  String? message;

  Data({this.message});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}
