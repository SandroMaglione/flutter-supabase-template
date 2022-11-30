import 'package:flutter_supabase_complete/app/failures/sign_in_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_out_failure.dart';
import 'package:flutter_supabase_complete/app/failures/sign_up_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  TaskEither<SignInFailure, String> signInEmailAndPassword(
    String email,
    String password,
  );

  TaskEither<SignUpFailure, String> signUpEmailAndPassword(
    String email,
    String password,
  );

  TaskEither<SignOutFailure, Unit> signOut();
}
