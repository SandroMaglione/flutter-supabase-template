import 'package:flutter_supabase_complete/app/failures/get_user_information_failure.dart';
import 'package:flutter_supabase_complete/app/failures/update_user_information_failure.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserDatabaseRepository {
  TaskEither<GetUserInformationFailure, UserModel> getUserInformation(
    String userId,
  );

  TaskEither<UpdateUserInformationFailure, UserModel> updateUserInformation(
    UserModel userModel,
  );
}
