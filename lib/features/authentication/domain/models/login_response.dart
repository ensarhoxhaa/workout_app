
import 'package:workout_app/core/core.dart';

class LoginResponse {

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.role,
    required this.companyId,
    required this.loginCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json[LoginResponseJsonKeys.accessToken] as String?,
      tokenType: json[LoginResponseJsonKeys.tokenType] as String?,
      role: json[LoginResponseJsonKeys.role] as List<dynamic>?,
      companyId: json[LoginResponseJsonKeys.companyId] as int?,
      loginCode: json[LoginResponseJsonKeys.loginCode] as int?,
    );
  }
  
  String? accessToken;
  String? tokenType;
  List<dynamic>? role;
  int? companyId;
  int? loginCode;

  LoginResponse copyWith({
    String? accessToken,
    String? tokenType,
    List<dynamic>? role,
    int? companyId,
    int? loginCode,
  }) {
    return LoginResponse(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      role: role ?? this.role,
      companyId: companyId ?? this.companyId,
      loginCode: loginCode ?? this.loginCode,
    );
  }
}
