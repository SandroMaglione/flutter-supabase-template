import 'package:flutter_supabase_complete/app/models/user_model.dart';

abstract class UserDatabaseRepository {
  Future<UserModel> getUserInformation(String userId);
}
