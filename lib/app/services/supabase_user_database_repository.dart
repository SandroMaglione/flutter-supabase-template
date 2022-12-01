import 'package:flutter_supabase_complete/app/failures/get_user_information_failure.dart';
import 'package:flutter_supabase_complete/app/failures/update_user_information_failure.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/core/config/supabase_table.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: UserDatabaseRepository)
class SupabaseDatabaseRepository implements UserDatabaseRepository {
  final Supabase _supabase;
  final UserSupabaseTable _userSupabaseTable;
  const SupabaseDatabaseRepository(this._supabase, this._userSupabaseTable);

  @override
  TaskEither<GetUserInformationFailure, UserModel> getUserInformation(
          String userId) =>
      TaskEither<GetUserInformationFailure, dynamic>.tryCatch(
        () => _supabase.client
            .from(_userSupabaseTable.tableName)
            .select()
            .eq(_userSupabaseTable.idColumn, userId)
            .single(),
        RequestGetUserInformationFailure.new,
      )
          .flatMap(
            (response) => Either.tryCatch(
              () => response as Map<String, dynamic>,
              (_, __) => ResponseFormatErrorGetUserInformationFailure(response),
            ).toTaskEither(),
          )
          .flatMap(
            (map) => Either.tryCatch(
              () => UserModel.fromJson(map),
              (_, __) => JsonDecodeGetUserInformationFailure(map),
            ).toTaskEither(),
          );

  @override
  TaskEither<UpdateUserInformationFailure, UserModel> updateUserInformation(
    UserModel userModel,
  ) =>
      TaskEither<UpdateUserInformationFailure, dynamic>.tryCatch(
        () => _supabase.client
            .from(_userSupabaseTable.tableName)
            .update(userModel.toJson()),
        RequestUpdateUserInformationFailure.new,
      ).map((_) => userModel);
}
