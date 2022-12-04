import 'package:flutter_supabase_complete/app/failures/login_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_out_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<LoginFailure, String> signInEmailAndPassword(
    String email,
    String password,
  );

  TaskEither<LoginFailure, String> signUpEmailAndPassword(
    String email,
    String password,
  );

  TaskEither<SignOutFailure, Unit> signOut();
}
