class ApiDisconnectException implements Exception {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  ApiDisconnectException({
    this.error,
    this.message = '',
    this.stackTrace,
  }) : super();
}

class ApiError implements Exception {
  final String message;
  final String error;

  ApiError({
    required this.error,
    required this.message,
  }) : super();

  factory ApiError.fromError(Map<String, dynamic> map) {
    return ApiError(
      message: map['message'] ?? '',
      error: map['code'] ?? '',
    );
  }

  @override
  String toString() => 'ApiError(message: $message, error: $error)';
}
