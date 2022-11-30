import 'package:flutter_supabase_complete/app/failures/sign_in_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_out_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_up_failure.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  final Supabase _supabase;
  const SupabaseAuthRepository(this._supabase);

  @override
  TaskEither<SignInFailure, String> signInEmailAndPassword(
    String email,
    String password,
  ) =>
      TaskEither<SignInFailure, AuthResponse>.tryCatch(
        () => _supabase.client.auth.signInWithPassword(
          email: email,
          password: password,
        ),
        ExecutionErrorSignInFailure.new,
      ).map((response) => response.user?.id).flatMap(
            (id) => Either.fromNullable(
              id,
              (_) => const MissingUserIdSignInFailure(),
            ).toTaskEither(),
          );

  @override
  TaskEither<SignUpFailure, String> signUpEmailAndPassword(
      String email, String password) async {
    final response = await _supabase.client.auth.signUp(
      email: email,
      password: password,
    );

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return userId;
  }

  @override
  TaskEither<SignOutFailure, Unit> signOut() => TaskEither.tryCatch(() async {
        await _supabase.client.auth.signOut();
        return unit;
      }, ExecutionErrorSignOutFailure.new);
}
