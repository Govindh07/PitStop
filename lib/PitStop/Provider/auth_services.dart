import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? get currentUser => firebaseAuth.currentUser;

Stream<User?> get authStateChange => firebaseAuth.authStateChanges();


Future<UserCredential> signIn(
{
  required String email,
  required String password
}) async {
  return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
}


Future<UserCredential> signUp({
  required String name,
  required String email,
  required String password
}) async {
  return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
}



Future<void> signOut() async{
  await firebaseAuth.signOut();
}


Future<void> resetPasswordFromCurrentPassword({
  required String email,
  required String currentPassword,
  required String newPassword,
}) async {
  AuthCredential credential =
      EmailAuthProvider.credential(email: email, password: currentPassword);
  await currentUser!.reauthenticateWithCredential(credential);
  await currentUser!.updatePassword(newPassword);

}
}