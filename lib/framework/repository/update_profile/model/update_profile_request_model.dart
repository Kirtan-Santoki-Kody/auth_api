class UpdateProfileRequestModel {
  String? firstName;
  String? lastName;
  String? phone;
  DateTime? dateOfBirth;

  UpdateProfileRequestModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
  });

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequestModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
      );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "date_of_birth":
        "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
  };
}
