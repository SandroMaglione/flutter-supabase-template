import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  @override
  Future<String> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
