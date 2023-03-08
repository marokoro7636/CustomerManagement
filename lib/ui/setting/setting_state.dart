import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'setting_state.freezed.dart';

enum LoadingType {
  upload,
  download,
  neutral,
}

@freezed
class GoogleState with _$GoogleState {
  const factory GoogleState({
    required GoogleSignInAccount currentUser,
    required drive.FileList list,
  }) = _GoogleState;
}

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    AsyncValue<GoogleState>? googleState,
    required LoadingType loadingType,
  }) = _SettingState;
}