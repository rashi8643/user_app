abstract class AuthenticationRepository {
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
  Future<void> signOut();
}
