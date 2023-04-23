import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:flutter_supabase_complete/injectable.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("Sign in"),
            TextField(
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              onChanged: (value) {
                setState(() => email = value);
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
            ElevatedButton(
              onPressed: () => _onClickSignIn(context),
              child: const Text('Sign in'),
            ),
            ElevatedButton(
              onPressed: () => _onClickGoToSignUp(context),
              child: const Text('Go to sign up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSignIn(BuildContext context) async =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            await getIt<AuthRepository>()
                .signInEmailAndPassword(email, password)
                .match(
                  (loginFailure) => loginFailure.mapToErrorMessage,
                  (_) => "Sign in successful",
                )
                .run(),
          ),
        ),
      );

  void _onClickGoToSignUp(BuildContext context) {
    context.router.push(const SignUpRoute());
  }
}
