import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';

class GoogleDriveRepository {
  GoogleDriveRepository() {
    init();
  }

  GoogleSignInAccount? currentUser;
  final _googleSignIn = GoogleSignIn(
      scopes: [
        DriveApi.driveAppdataScope,
      ]
  );

  void init() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      currentUser = account;
    });
    _googleSignIn.signInSilently();
  }

  // Googleにサインイン
  Future signInWithGoogle() async {
    try {
      currentUser =  await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  Future signOutWithGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  // GoogleドライブにDBをアップロード
  // GoogleドライブからDBをインポート
}