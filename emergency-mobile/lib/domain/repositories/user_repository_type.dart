abstract class UserRepositoryType {
  String get accessToken;

  Future<void> login();
}
