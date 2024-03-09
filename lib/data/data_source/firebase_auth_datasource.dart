abstract class FirebaseAuthDatasource {
  Future<(String, int?)> phoneNumberSignIn(
    String number,
  );
}
