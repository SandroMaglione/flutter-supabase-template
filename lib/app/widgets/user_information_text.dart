import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';

class UserInformationText extends StatelessWidget {
  final String userId;
  const UserInformationText({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: getIt<UserDatabaseRepository>().getUserInformation(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          if (data != null) {
            return Text(data.firstName ?? "No name");
          }

          return const Text("No found");
        }

        return const Text("Error");
      },
    );
  }
}
