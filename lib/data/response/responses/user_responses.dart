import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_responses.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "prefix")
  final String prefix;

  @JsonKey(name: "phone")
  final String phone;

  @JsonKey(name: "email_verified_at")
  final String emailVerifiedAt;

  @JsonKey(name: "roles")
  final List<String> roles;

  @JsonKey(name: "avatar")
  final String? avatar;

  @JsonKey(name: "active")
  final int active;

  UserResponse(
      this.id,
      this.name,
      this.email,
      this.prefix,
      this.phone,
      this.emailVerifiedAt,
      this.roles,
      this.avatar,
      this.active,
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "user")
  final UserResponse user;

  UserDataResponse(this.user);

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

@JsonSerializable()
class UserApiResponse extends BaseResponse{


  @JsonKey(name: "data")
  final UserDataResponse data;

  UserApiResponse(this.data);

  factory UserApiResponse.fromJson(Map<String, dynamic> json) =>
      _$UserApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiResponseToJson(this);
}
