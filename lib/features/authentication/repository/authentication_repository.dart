import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/core.dart';
import 'package:workout_app/features/authentication/domain/models/login_response.dart';

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepository(ref.read(dioProvider)),
);

class AuthenticationRepository with RepositoryExceptionMixin {
  AuthenticationRepository(this._dio);

  final Dio _dio;

  Future<RepoResponse<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await exceptionHandler(
        _dio.post<dynamic>(
          PathKeys.login,
          data: {
            AppStrings.emailKey: email,
            AppStrings.passwordKey: password,
          },
        ),
      );
      final responseDecoded =
          LoginResponse.fromJson(response.data as Map<String, dynamic>);
      return RepoResponse.success(responseDecoded.accessToken);
    } on RepositoryException catch (e) {
      return RepoResponse.failure(e.exceptionType);
    }
  }
}
