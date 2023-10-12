class ValidationResponse {
  /// Shorthand constructor
  ValidationResponse({
    required this.type,
    required this.validated,
    this.errorMessage,
  });

  final dynamic type;
  final bool validated;
  final String? errorMessage;
}
