abstract class SignUpFailure {
  const SignUpFailure();
}

class ExecutionErrorSignUpFailure implements SignUpFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorSignUpFailure(this.error, this.stackTrace);
}

class MissingUserIdSignUpFailure implements SignUpFailure {
  const MissingUserIdSignUpFailure();
}
