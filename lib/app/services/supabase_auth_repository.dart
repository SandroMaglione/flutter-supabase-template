import 'package:flutter_supabase_complete/app/failures/login_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_out_failure.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  final Supabase _supabase;
  const SupabaseAuthRepository(this._supabase);

  @override
  TaskEither<LoginFailure, String> signInEmailAndPassword(
    String email,
    String password,
  ) =>
      _loginRequest(
        () => _supabase.client.auth
            .signInWithPassword(email: email, password: password),
      );

  @override
  TaskEither<LoginFailure, String> signUpEmailAndPassword(
    String email,
    String password,
  ) =>
      _loginRequest(
        () => _supabase.client.auth.signUp(email: email, password: password),
      );

  @override
  TaskEither<SignOutFailure, Unit> signOut() => TaskEither.tryCatch(() async {
        await _supabase.client.auth.signOut();
        return unit;
      }, ExecutionErrorSignOutFailure.new);

  /// Shared logic for login requests (sign in and sign up).
  TaskEither<LoginFailure, String> _loginRequest(
    Future<AuthResponse> Function() request,
  ) =>
      TaskEither<LoginFailure, AuthResponse>.tryCatch(
        request,
        (error, stackTrace) {
          if (error is AuthException) {
            return AuthErrorLoginFailure(error.message, error.statusCode);
          }

          return ExecutionErrorLoginFailure(error, stackTrace);
        },
      ).map((response) => response.user?.id).flatMap(
            (id) => Either.fromNullable(
              id,
              () => const MissingUserIdLoginFailure(),
            ).toTaskEither(),
          );
}
