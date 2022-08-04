abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'SOME_DEFAULT_VALUE',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue: 'SOME_DEFAULT_VALUE',
  );
}
