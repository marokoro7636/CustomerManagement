import 'dart:io';

import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/ui/setting/setting_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

final googleRepositoryProvider = Provider((ref) => GoogleDriveRepository());

class GoogleDriveRepository {
  final _googleSignIn = GoogleSignIn(scopes: [
    drive.DriveApi.driveAppdataScope,
  ]);

  // Googleにサインイン
  Future<GoogleState?> signInWithGoogle() async {
    final currentUser = await _googleSignIn.signIn();
    final list = await listGoogleDriveFiles();

    if (currentUser == null || list == null) {
      return null;
    } else {
      return GoogleState(
        currentUser: currentUser,
        list: list,
      );
    }
  }

  Future<GoogleState?> signInWithGoogleSilently() async {
    final currentUser = await _googleSignIn.signInSilently();
    final list = await listGoogleDriveFiles();

    if (currentUser == null || list == null) {
      return null;
    } else {
      return GoogleState(
        currentUser: currentUser,
        list: list,
      );
    }
  }

  Future<void> signOutWithGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<drive.FileList?> listGoogleDriveFiles() async {
    final httpClient = await _googleSignIn.authenticatedClient();

    if (httpClient == null) return null;

    final googleDriveApi = drive.DriveApi(httpClient);
    return await googleDriveApi.files.list(
      spaces: 'appDataFolder',
      $fields: 'files(id, name, modifiedTime)',
    );
  }

  // GoogleドライブにDBをアップロード
  Future uploadFileToGoogleDrive() async {
    final httpClient = await _googleSignIn.authenticatedClient();

    if (httpClient == null) return null;

    final googleDriveApi = drive.DriveApi(httpClient);

    // バックアップファイルは1つのみとする
    final list = await listGoogleDriveFiles();
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
    final httpClient = await _googleSignIn.authenticatedClient();

    if (httpClient == null) return null;

    final googleDriveApi = drive.DriveApi(httpClient);

    final list = await listGoogleDriveFiles();
    if (list!.files!.isEmpty) return;

    drive.Media file = (await googleDriveApi.files.get(
      list.files![0].id!,
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
    );
  }
}
