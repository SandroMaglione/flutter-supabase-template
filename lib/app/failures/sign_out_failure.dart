abstract class SignOutFailure {
  const SignOutFailure();
}

class ExecutionErrorSignOutFailure extends SignOutFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorSignOutFailure(this.error, this.stackTrace);
}
