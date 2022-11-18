import 'package:flutter_supabase_complete/app/repository/database_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: DatabaseRepository)
class SupabaseDatabaseRepository implements DatabaseRepository {
  final Supabase _supabase;
  const SupabaseDatabaseRepository(this._supabase);

  @override
  Future<String> getUserInformation(String userId) {
    // TODO: implement getUserInformation
    throw UnimplementedError();
  }
}
