import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workout_app/core/exceptions/repository_exception.dart';

class SecureStorage with RepositoryExceptionMixin {
  SecureStorage({required FlutterSecureStorage flutterSecureStorage})
      : _storage = flutterSecureStorage;

  final FlutterSecureStorage _storage;

  Future<RepoResponse<void>> writeSecureData({
    required String key,
    required String value,
  }) async {
    try {
      await exceptionHandler(
        _storage.write(key: key, value: value),
      );
      return RepoResponse.success();
    } on RepositoryException catch (e) {
      return RepoResponse.failure(e.exceptionType);
    }
  }

  Future<RepoResponse<String>> readSecureData({required String key}) async {
    try {
      final value = await exceptionHandler(
        _storage.read(key: key),
      );
      return RepoResponse.success(value);
    } on RepositoryException catch (e) {
      return RepoResponse.failure(e.exceptionType);
    }
  }
}

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final secureStorageProvider = Provider<SecureStorage>(
  (ref) => SecureStorage(
    flutterSecureStorage: ref.read(
      flutterSecureStorageProvider,
    ),
  ),
);
