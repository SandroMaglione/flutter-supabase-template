import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:flutter_supabase_complete/injectable.dart';

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
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
            ElevatedButton(
              onPressed: () => _onClickSignUp(context),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSignUp(BuildContext context) async {
    try {
      await getIt<AuthRepository>().signUpEmailAndPassword(email, password);
      context.router.push(const HomeRoute());
    } catch (e) {
      // TODO: Show proper error to users
      print("Sign up error");
      print(e);
    }
  }
}
