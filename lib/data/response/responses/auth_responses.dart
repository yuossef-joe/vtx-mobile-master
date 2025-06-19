
import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';
part 'auth_responses.g.dart';

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name :"avatar")
  String? avatar;
  @JsonKey(name :"role")
  String role;
  @JsonKey(name: "verified")
  bool verify;
  @JsonKey(name:"type")
  String approval;
  @JsonKey(name: "access_token")
  String? token;
  CustomerResponse(this.id, this.name, this.email,this.avatar,this.role,this.verify,this.approval,this.token);
  //from json
  factory CustomerResponse.fromJson(Map<String,dynamic> json) => _$CustomerResponseFromJson(json);
  // to json
  Map<String,dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "data")
  CustomerResponse? customer;
  AuthenticationResponse(this.customer);

  //from json
  factory AuthenticationResponse.fromJson(Map<String,dynamic> json) => _$AuthenticationResponseFromJson(json);
  // to json
  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class RegisterResponse extends BaseResponse{
  @JsonKey(name: "data")
  RegisterMap? map;
  RegisterResponse(this.map);

  //from json
  factory RegisterResponse.fromJson(Map<String,dynamic> json) => _$RegisterResponseFromJson(json);
  // to json
  Map<String,dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class RegisterMap{
  @JsonKey(name: "msg")
  String? msg;
  RegisterMap(this.msg);
  //from json
  factory RegisterMap.fromJson(Map<String,dynamic> json) => _$RegisterMapFromJson(json);
  // to json
  Map<String,dynamic> toJson() => _$RegisterMapToJson(this);

}

@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: 'support')
  String? support;

  ForgotPasswordResponse(this.support);

// toJson
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

//fromJson
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

@JsonSerializable()
class AuthStatus {
  @JsonKey(name: 'auth')
  bool? auth;

  AuthStatus(this.auth);

// toJson
  Map<String, dynamic> toJson() => _$AuthStatusToJson(this);

//fromJson
  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);
}

@JsonSerializable()
class CheckAuthResponse extends BaseResponse{
  @JsonKey(name: 'data')
  AuthStatus? authStatus;

  CheckAuthResponse(this.authStatus);

// toJson
  Map<String, dynamic> toJson() => _$CheckAuthResponseToJson(this);

//fromJson
  factory CheckAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckAuthResponseFromJson(json);
}



