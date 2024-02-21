import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  var isUserSignedIn = false.obs;
  var userDisplayname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      isUserSignedIn.value = (account != null);
      if (account != null) {
        userDisplayname.value = account.displayName!;
      }
    });

    _googleSignIn.signInSilently();

    // Check sign-in status when the app starts
    _checkSignInStatus();
  }

  Future<void> _checkSignInStatus() async {
    bool isSignedIn = await _googleSignIn.isSignedIn();
    isUserSignedIn.value = isSignedIn;
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
      // TODO: Show an error message to the user or log the error
    }
  }

  Future<void> handleSignOut() =>
      _googleSignIn.signOut(); // Sign out the user without disconnecting them
}
