import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => _onClickSignOut(context),
              child: const Text("Sign out"),
            ),
            FutureBuilder<UserModel>(
              future:
                  getIt<UserDatabaseRepository>().getUserInformation(user.id),
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
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSignOut(BuildContext context) async {
    try {
      await getIt<AuthRepository>().signOut();
    } catch (e) {
      // TODO: Show proper error to users
      print("Error on sign out");
      print(e);
    }
  }
}
