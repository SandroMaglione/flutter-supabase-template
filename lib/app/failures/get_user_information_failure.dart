abstract class GetUserInformationFailure {
  const GetUserInformationFailure();
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
