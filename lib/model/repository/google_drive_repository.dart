import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart';

class GoogleDriveRepository {
  final _googleSignIn = GoogleSignIn(
      scopes: [
        DriveApi.driveAppdataScope,
      ]
  );

  // Googleにサインイン(Userを返す)
  // GoogleドライブにDBをアップロード
  // GoogleドライブからDBをインポート
}