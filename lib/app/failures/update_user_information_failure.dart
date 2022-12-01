abstract class UpdateUserInformationFailure {
  const UpdateUserInformationFailure();

  String get mapToErrorMessage {
    switch (runtimeType) {
      case RequestUpdateUserInformationFailure:
        return 'Error when updating user information';
    }

    return 'Unexpected error, please try again';
  }
}

class RequestUpdateUserInformationFailure extends UpdateUserInformationFailure {
  final Object error;
  final StackTrace stackTrace;
  const RequestUpdateUserInformationFailure(this.error, this.stackTrace);
}
