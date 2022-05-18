class RestApiException implements Exception {
  RestApiException([this._message]);

  final String? _message;

  @override
  String toString() {
    return _message ?? '';
  }
}

class FetchDataException extends RestApiException {
  FetchDataException([String? message]) : super(message);
}

class BadRequestException extends RestApiException {
  BadRequestException([String? message]) : super(message);
}

class UnauthorisedException extends RestApiException {
  UnauthorisedException([String? message]) : super(message);
}

class InvalidInputException extends RestApiException {
  InvalidInputException([String? message]) : super(message);
}
