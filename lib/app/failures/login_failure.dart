abstract class LoginFailure {
  const LoginFailure();
}

class ExecutionErrorLoginFailure implements LoginFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorLoginFailure(this.error, this.stackTrace);
}

class MissingUserIdLoginFailure implements LoginFailure {
  const MissingUserIdLoginFailure();
}
