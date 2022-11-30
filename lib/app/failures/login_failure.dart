abstract class LoginFailure {
  const LoginFailure();

  String get mapToErrorMessage {
    final failure = this;
    if (failure is AuthErrorLoginFailure) {
      return failure.message;
    } else if (failure is ExecutionErrorLoginFailure) {
      return 'Error when making login request';
    } else if (failure is MissingUserIdLoginFailure) {
      return 'Missing user information';
    }

    return 'Unexpected error, please try again';
  }
}

class AuthErrorLoginFailure extends LoginFailure {
  final String message;
  final String? statusCode;
  const AuthErrorLoginFailure(this.message, this.statusCode);
}

class ExecutionErrorLoginFailure extends LoginFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorLoginFailure(this.error, this.stackTrace);
}

class MissingUserIdLoginFailure extends LoginFailure {
  const MissingUserIdLoginFailure();
}
