import 'dart:io';

import 'package:customer_management/model/db/app_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

final googleRepositoryProvider = Provider((ref) => GoogleDriveRepository());

class GoogleDriveRepository {
  GoogleSignInAccount? currentUser;
  drive.FileList? list;
  final _googleSignIn = GoogleSignIn(scopes: [
    drive.DriveApi.driveAppdataScope,
  ]);

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
      list = null;
    } catch (e) {
      print(e);
    }
  }

  Future listGoogleDriveFiles() async {
    if (currentUser == null) return;

    final httpClient = (await _googleSignIn.authenticatedClient())!;
    final googleDriveApi = drive.DriveApi(httpClient);
    await googleDriveApi.files
        .list(spaces: 'appDataFolder', $fields: 'files(id, name, modifiedTime)')
        .then((value) {
      list = value;
    });
  }

  // GoogleドライブにDBをアップロード
  Future uploadFileToGoogleDrive() async {
    if (currentUser == null) return;

    final httpClient = (await _googleSignIn.authenticatedClient())!;
    final googleDriveApi = drive.DriveApi(httpClient);

    // バックアップファイルは1つのみとする
    await listGoogleDriveFiles();
    for (var file in list!.files!) {
      await googleDriveApi.files.delete(file.id!);
    }

    final uploadFile = drive.File();
    uploadFile.parents = ['appDataFolder'];
    uploadFile.name = AppDatabase.dbFileName;

    final path = await AppDatabase.getDbPath();
    final file = File(path);
    await googleDriveApi.files.create(uploadFile,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
  }

  // GoogleドライブからDBをインポート
  Future downloadGoogleDriveFile() async {
    if (currentUser == null) return;

    await listGoogleDriveFiles();
    if (list!.files!.isEmpty) return;

    final httpClient = (await _googleSignIn.authenticatedClient())!;
    final googleDriveApi = drive.DriveApi(httpClient);
    drive.Media file = (await googleDriveApi.files.get(
      list!.files![0].id!,
      downloadOptions: drive.DownloadOptions.fullMedia,
    )) as drive.Media;

    final path = await AppDatabase.getDbPath();
    final saveFile = File(path);

    List<int> dataStore = [];
    file.stream.listen(
      (data) {
        dataStore.insertAll(dataStore.length, data);
      },
      onDone: () async {
        await saveFile.writeAsBytes(dataStore);
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
