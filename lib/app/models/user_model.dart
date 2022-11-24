/// Convert database model for `user` table to
/// internal dart `class`.
///
/// Use `fromJson` method to convert supabase response to [UserModel]
class UserModel {
  final String id;
  final String? firstName;
  final String? lastName;

  const UserModel({
    required this.id,
    this.firstName,
    this.lastName,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
      );
}
