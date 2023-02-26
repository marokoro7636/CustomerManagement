import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleRepositoryProvider = Provider((ref) => GoogleDriveRepository());

class GoogleDriveRepository {
  GoogleSignInAccount? currentUser;
  final _googleSignIn = GoogleSignIn(
      scopes: [
        DriveApi.driveAppdataScope,
      ]
  );

  // Googleにサインイン
  Future signInWithGoogle() async {
    try {
      currentUser = await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  Future signOutWithGoogle() async {
    try {
      currentUser = await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  // GoogleドライブにDBをアップロード
  // GoogleドライブからDBをインポート
}