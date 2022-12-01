import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/models/user_model.dart';
import 'package:flutter_supabase_complete/app/repository/user_database_repository.dart';
import 'package:flutter_supabase_complete/injectable.dart';

class UpdateUserForm extends StatefulWidget {
  final String userId;
  const UpdateUserForm({
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  String firstName = "";
  String lastName = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => setState(() {
            firstName = value;
          }),
        ),
        TextField(
          onChanged: (value) => setState(() {
            lastName = value;
          }),
        ),
        ElevatedButton(
          onPressed: _onClickUpdateUser,
          child: const Text("Update"),
        ),
      ],
    );
  }

  Future<void> _onClickUpdateUser() async =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            await getIt<UserDatabaseRepository>()
                .updateUserInformation(
                  UserModel(
                    id: widget.userId,
                    firstName: firstName,
                    lastName: lastName,
                  ),
                )
                .match(
                  (failure) => failure.mapToErrorMessage,
                  (_) => "Information updated successfully",
                )
                .run(),
          ),
        ),
      );
}
