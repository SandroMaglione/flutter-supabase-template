abstract class AuthRepository {
  Future<String> signInEmailAndPassword(String email, String password);
  Future<String> signUpEmailAndPassword(String email, String password);

  Future<void> signOut();
}
