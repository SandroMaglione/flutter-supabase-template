import 'package:flutter_supabase_complete/app/models/user_model.dart';
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
  Future<UserModel> getUserInformation(String userId) async {
    final response = await _supabase.client
        .from(_userSupabaseTable.tableName)
        .select()
        .eq(_userSupabaseTable.idColumn, userId)
        .single();

    final userModel = UserModel.fromJson(response as Map<String, dynamic>);
    return userModel;
  }

  @override
  Future<UserModel> updateUserInformation(UserModel userModel) async {
    await _supabase.client
        .from(_userSupabaseTable.tableName)
        .update(userModel.toJson());
    return userModel;
  }
}
