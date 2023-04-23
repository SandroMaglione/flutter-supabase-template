import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("Sign up"),
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
              onPressed: () => _onClickSignUp(context),
              child: const Text('Sign up'),
            ),
            ElevatedButton(
              onPressed: () => _onClickGoToSignIn(context),
              child: const Text('Go to sign in'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSignUp(BuildContext context) async =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            await getIt<AuthRepository>()
                .signUpEmailAndPassword(email, password)
                .match(
                  (loginFailure) => loginFailure.mapToErrorMessage,
                  (_) => "Sign up successful",
                )
                .run(),
          ),
        ),
      );

  void _onClickGoToSignIn(BuildContext context) {
    context.router.pop();
  }
}
