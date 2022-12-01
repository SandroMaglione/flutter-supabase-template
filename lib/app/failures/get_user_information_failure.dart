abstract class GetUserInformationFailure {
  const GetUserInformationFailure();

  String get mapToErrorMessage {
    switch (runtimeType) {
      case RequestGetUserInformationFailure:
        return 'Error when getting user information';
      case ResponseFormatErrorGetUserInformationFailure:
        return 'Invalid response';
      case JsonDecodeGetUserInformationFailure:
        return 'Missing valid user information';
    }

    return 'Unexpected error, please try again';
  }
}

class RequestGetUserInformationFailure extends GetUserInformationFailure {
  final Object error;
  final StackTrace stackTrace;
  const RequestGetUserInformationFailure(this.error, this.stackTrace);
}

class ResponseFormatErrorGetUserInformationFailure
    extends GetUserInformationFailure {
  final dynamic response;
  const ResponseFormatErrorGetUserInformationFailure(this.response);
}

class JsonDecodeGetUserInformationFailure extends GetUserInformationFailure {
  final Map<String, dynamic> data;
  const JsonDecodeGetUserInformationFailure(this.data);
}
