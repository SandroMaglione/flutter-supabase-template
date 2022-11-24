import 'package:injectable/injectable.dart';

/// Set of all the database tables in Supabase.
///
/// Used to reference valid tables when making database requests.
abstract class SupabaseTable {
  const SupabaseTable();
  String get tableName;
}

@lazySingleton
class UserSupabaseTable implements SupabaseTable {
  const UserSupabaseTable();

  @override
  String get tableName => "user";

  String get idColumn => "id";
  String get idFirstName => "first_name";
  String get idLastName => "last_name";
}
