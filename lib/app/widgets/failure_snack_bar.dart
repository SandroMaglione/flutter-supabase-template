import 'package:flutter/material.dart';

class FailureSnackBar extends StatelessWidget {
  final String message;

  const FailureSnackBar({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
    );
  }
}
