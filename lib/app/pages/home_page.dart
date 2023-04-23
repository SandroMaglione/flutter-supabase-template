import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/app/widgets/update_user_form.dart';
import 'package:flutter_supabase_complete/app/widgets/user_information_text.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
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
            UpdateUserForm(userId: user.id),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSignOut(BuildContext context) async =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            await getIt<AuthRepository>()
                .signOut()
                .match(
                  (signOutFailure) => signOutFailure.mapToErrorMessage,
                  (_) => "Sign out successful",
                )
                .run(),
          ),
        ),
      );
}
