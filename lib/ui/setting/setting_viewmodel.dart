import 'package:customer_management/model/repository/google_drive_repository.dart';
import 'package:customer_management/ui/setting//setting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingProvider =
StateNotifierProvider<SettingViewModel, SettingState>(
        (ref) => SettingViewModel(ref));

class SettingViewModel extends StateNotifier<SettingState> {
  SettingViewModel(this.ref) : super(const SettingState());

  final Ref ref;
  late final googleRepository = ref.watch(googleRepositoryProvider);

  void signIn() async {
    if (state.currentUser != null) return;
    await googleRepository.signInWithGoogle();
    state = state.copyWith(currentUser: googleRepository.currentUser);
  }

  void signOut() async {
    await googleRepository.signOutWithGoogle();
    state = state.copyWith(currentUser: googleRepository.currentUser);
  }

  void p() {
    print('repo : ${googleRepository.currentUser}');
    print('state : ${state.currentUser}');
  }

}
