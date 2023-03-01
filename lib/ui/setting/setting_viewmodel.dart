import 'package:customer_management/model/repository/google_drive_repository.dart';
import 'package:customer_management/ui/setting//setting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingProvider =
    StateNotifierProvider<SettingViewModel, AsyncValue<SettingState>>(
        (ref) => SettingViewModel(ref));

class SettingViewModel extends StateNotifier<AsyncValue<SettingState>> {
  SettingViewModel(this.ref) : super(const AsyncValue.data(SettingState()));

  final Ref ref;
  late final googleRepository = ref.watch(googleRepositoryProvider);

  void signIn() async {
    if (state.value!.currentUser != null) return;
    state = await AsyncValue.guard(() async {
      await googleRepository.signInWithGoogle();
      return state.value!.copyWith(currentUser: googleRepository.currentUser);
    });
  }

  void signOut() async {
    state = await AsyncValue.guard(() async {
      await googleRepository.signOutWithGoogle();
      return state.value!.copyWith(currentUser: googleRepository.currentUser);
    });
  }

  void upload() async {
    if (state.value!.currentUser == null) return;
    state = const AsyncLoading<SettingState>().copyWithPrevious(state);
    try {
      await googleRepository.uploadFileToGoogleDrive();
      state = AsyncData<SettingState>(state.value!).copyWithPrevious(state);
    } catch (error, stackTrace) {
      state =
          AsyncError<SettingState>(error, stackTrace).copyWithPrevious(state);
    }
    print('upload finished');
  }

  void download() async {
    if (state.value!.currentUser == null) return;
    state = const AsyncLoading<SettingState>().copyWithPrevious(state);
    try {
      await googleRepository.downloadGoogleDriveFile();
      state = AsyncData<SettingState>(state.value!).copyWithPrevious(state);
    } catch (error, stackTrace) {
      state =
          AsyncError<SettingState>(error, stackTrace).copyWithPrevious(state);
    }
    print('download finished');
  }

  void infoForDebug() async {
    print('repo : ${googleRepository.currentUser}');
    print('state : ${state.value!.currentUser}');
    await googleRepository.listGoogleDriveFiles();
  }
}
