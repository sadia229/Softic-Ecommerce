import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.activated,
    required this.langKey,
    required this.createdBy,
    this.createdDate,
    required this.lastModifiedBy,
    required this.lastModifiedDate,
    required this.authorities,
  });

  int id;
  String login;
  String firstName;
  String lastName;
  String email;
  String phone;
  String imageUrl;
  bool activated;
  String langKey;
  String createdBy;
  dynamic createdDate;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  List<String> authorities;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    login: json["login"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    imageUrl: json["imageUrl"],
    activated: json["activated"],
    langKey: json["langKey"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    lastModifiedBy: json["lastModifiedBy"],
    lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
    authorities: List<String>.from(json["authorities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "imageUrl": imageUrl,
    "activated": activated,
    "langKey": langKey,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "lastModifiedBy": lastModifiedBy,
    "lastModifiedDate": lastModifiedDate.toIso8601String(),
    "authorities": List<dynamic>.from(authorities.map((x) => x)),
  };
}
