import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/app/widgets/user_information_text.dart';
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
            UserInformationText(userId: user.id),
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
