// lib/core/error/exceptions.dart

/// Represents an exception that occurs during an API call.
class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}