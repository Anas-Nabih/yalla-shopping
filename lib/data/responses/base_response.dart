import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.email, this.phone, this.role,
      this.numOfNotifications);

  /// from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  /// to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;

  AuthenticationResponse(this.customer);

  /// from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  /// to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
