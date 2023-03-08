import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;

part 'setting_state.freezed.dart';

enum LoadType {
  upload,
  download,
}

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    GoogleSignInAccount? currentUser,
    drive.FileList? list,
    LoadType? loadType,
  }) = _SettingState;
}