import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/core/core.dart';
import 'package:workout_app/features/authentication/repository/authentication_repository.dart';
import 'package:workout_app/features/authentication/repository/secure_storage_repository.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
  (ref) => AuthenticationService(
    authenticationRepository: ref.read(authenticationRepositoryProvider),
    secureStorage: ref.read(secureStorageProvider),
  ),
);

class AuthenticationService {
  AuthenticationService({
    required AuthenticationRepository authenticationRepository,
    required SecureStorage secureStorage,
  })  : _authenticationRepository = authenticationRepository,
        _secureStorage = secureStorage;

  final AuthenticationRepository _authenticationRepository;
  final SecureStorage _secureStorage;

  Future<RepoResponse<void>> login({
    required String email,
    required String password,
  }) async {
    final response =
        await _authenticationRepository.login(email: email, password: password);
    if (response.isSuccess) {
      final storageResponse = await _secureStorage.writeSecureData(
        key: AppStrings.jwtTokenKey,
        value: response.data!,
      );
      if (storageResponse.isSuccess) {
        return RepoResponse.success();
      } else {
        return RepoResponse.failure(storageResponse.exceptionType);
      }
    } else {
      return RepoResponse.failure(response.exceptionType);
    }
  }

  Future<RepoResponse<String?>> getAuthenticatedUserToken() async {
    final response =
        await _secureStorage.readSecureData(key: AppStrings.jwtTokenKey);
    if(response.isSuccess) {
      return RepoResponse.success(response.data);
    }
    else {
      return RepoResponse.failure(response.exceptionType);
    }
  }
}
