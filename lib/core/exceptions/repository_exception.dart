import 'dart:async';

import 'package:workout_app/core/core.dart';

/// A [RepositoryException] is thrown when an error occurs in a repository.
/// It is used to wrap the original exception and provide a more meaningful
class RepositoryException implements Exception {
  /// Creates a [RepositoryException].
  RepositoryException( {
    required this.message,
    this.exception,
    this.stackTrace,
    this.exceptionType,
  });

  /// The message of the exception.
  final String message;

  /// The original exception.
  final Exception? exception;

  final ExceptionType? exceptionType;

  /// The original stack trace.
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RepositoryException: $message';
  }
}

mixin RepositoryExceptionMixin {
  /// Wraps the original exception and provides a more meaningful message.
  Future<T> exceptionHandler<T>(
      FutureOr<T> computation, {
        String unknownMessage = 'Repository Exception',
      }) async {
    try {
      return await computation;
    }
    on Exception catch (e, stackTrace) {
      logger.e('Error', error: e, stackTrace: stackTrace);
      throw RepositoryException(
        message: unknownMessage,
        exception: e,
        stackTrace: stackTrace,
        exceptionType: ExceptionType.unknown,
      );
    }
  }
}

class RepoResponse<T> {
  RepoResponse({
    required this.isSuccess,
    this.exceptionType,
    this.data,
  });

  RepoResponse.success([this.data])
      : isSuccess = true,
        exceptionType = null;

  RepoResponse.failure(this.exceptionType)
      : data = null,
        isSuccess = false;

  final bool isSuccess;
  final ExceptionType? exceptionType;
  final T? data;
}

enum ExceptionType {
  none(name: ''),
  unknown(name: '');

  const ExceptionType({required this.name});

  bool get hasError => this != ExceptionType.none;

  final String name;
}
