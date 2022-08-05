import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: onClickSignUp,
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  void onClickSignUp() {
    print(email);
    print(password);
  }
}
