import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/core/config/supabase_table.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: UserDatabaseRepository)
class SupabaseDatabaseRepository implements UserDatabaseRepository {
  final Supabase _supabase;
  final UserSupabaseTable _userSupabaseTable;
  const SupabaseDatabaseRepository(this._supabase, this._userSupabaseTable);

  @override
  Future<String> getUserInformation(String userId) async {
    final response =
        await _supabase.client.from(_userSupabaseTable.tableName).select().eq(
              _userSupabaseTable.userIdColumn,
              userId,
            );

    return response;
  }
}
