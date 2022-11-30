abstract class SignInFailure {
  const SignInFailure();
}

class ExecutionErrorSignInFailure implements SignInFailure {
  final Object error;
  final StackTrace stackTrace;
  const ExecutionErrorSignInFailure(this.error, this.stackTrace);
}

class MissingUserIdSignInFailure implements SignInFailure {
  const MissingUserIdSignInFailure();
}
