import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/failures/get_user_information_failure.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:fpdart/fpdart.dart';

class UserInformationText extends StatelessWidget {
  final String userId;
  const UserInformationText({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<GetUserInformationFailure, UserModel>>(
      future: getIt<UserDatabaseRepository>().getUserInformation(userId).run(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          if (data != null) {
            return data.fold(
              (failure) => Text(failure.mapToErrorMessage),
              (userModel) => Text(
                '${userModel.firstName} ${userModel.lastName}',
              ),
            );
          }

          return const Text("No found");
        }

        return const Text("Error");
      },
    );
  }
}
