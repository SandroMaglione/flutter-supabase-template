abstract class UpdateUserInformationFailure {
  const UpdateUserInformationFailure();
}

class RequestUpdateUserInformationFailure extends UpdateUserInformationFailure {
  final Object error;
  final StackTrace stackTrace;
  const RequestUpdateUserInformationFailure(this.error, this.stackTrace);
}
