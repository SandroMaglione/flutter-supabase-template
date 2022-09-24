import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
