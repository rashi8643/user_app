abstract class FireBaseAuthentication {
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
  Future<void> signout();
}
