import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  final Supabase _supabase;
  const SupabaseAuthRepository(this._supabase);

  @override
  Future<String> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
