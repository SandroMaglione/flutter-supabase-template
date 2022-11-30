abstract class LoginFailure {
  const LoginFailure();

  String get mapToErrorMessage {
    switch (runtimeType) {
      case ExecutionErrorLoginFailure:
        return 'Error when making sign in request';
      case MissingUserIdLoginFailure:
        return 'Missing user information';
    }

    return 'Unexpected error, please try again';
  }
}

class ExecutionErrorLoginFailure extends LoginFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorLoginFailure(this.error, this.stackTrace);
}

class MissingUserIdLoginFailure extends LoginFailure {
  const MissingUserIdLoginFailure();
}
