import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  final Supabase _supabase;
  const SupabaseAuthRepository(this._supabase);

  @override
  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signIn(
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
  Future<String> signUpEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signUp(email, password);

    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }

    return userId;
  }
}
