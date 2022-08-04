abstract class AuthRepository {
  Future<String> signInEmailAndPassword(String email, String password);
}
