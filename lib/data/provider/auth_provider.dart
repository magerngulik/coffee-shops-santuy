import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testing_local_storage/data/provider/user_service.dart';

class AuthService {
  static User? currentUser;
  static bool isMember = false;
  static bool isVendor = false;

  static doLoginAsMember() async {
    var isLoggedIn = await doGoogleLogin();
    await UserService.createUserIfNotExists();
    if (isLoggedIn) {
      currentUser = FirebaseAuth.instance.currentUser!;
      isMember = true;
    }
    return isLoggedIn;
  }

  static doLoginAsVendor() async {
    var isLoggedIn = await doGoogleLogin();
    await UserService.createUserIfNotExists();
    if (isLoggedIn) {
      currentUser = FirebaseAuth.instance.currentUser!;
      isVendor = true;
    }
    return isLoggedIn;
  }

  static doLogout() async {
    await FirebaseAuth.instance.signOut();
    isMember = false;
    isVendor = false;
  }

  static Future<bool> doGoogleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Future.value(true);
    } catch (_) {
      return Future.value(false);
    }
  }
}
