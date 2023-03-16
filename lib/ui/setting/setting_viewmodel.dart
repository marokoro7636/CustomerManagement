import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/repository/google_drive_repository.dart';
import 'package:customer_management/ui/setting/setting_state.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingProvider = StateNotifierProvider<SettingViewModel, SettingState>(
    (ref) => SettingViewModel(
          ref.watch(googleRepositoryProvider),
          ref.watch(customerRepositoryProvider),
        ));

class SettingViewModel extends StateNotifier<SettingState> {
  SettingViewModel(this.googleRepository, this.customerRepository)
      : super(const SettingState(loadingType: LoadingType.neutral));

  final GoogleDriveRepository googleRepository;
  final CustomerRepository customerRepository;

  void signIn() async {
    if (state.googleState != null) return;

    try {
      final googleState = await googleRepository.signInWithGoogle();
      if (googleState != null) {
        // ログイン成功
        state = state.copyWith(
          googleState: AsyncData(googleState),
        );
      }
    } catch (error, stackTrace) {
      state = state.copyWith(
        googleState: AsyncError<GoogleState>(error, stackTrace)
            .copyWithPrevious(state.googleState!),
        loadingType: LoadingType.neutral,
      );
    }
  }

  void signInSilently() async {
    if (state.googleState != null) return;

    try {
      final googleState = await googleRepository.signInWithGoogleSilently();
      if (googleState != null) {
        // ログイン成功
        state = state.copyWith(
          googleState: AsyncData(googleState),
        );
      }
    } catch (error) {
      state = state.copyWith(
        loadingType: LoadingType.neutral,
      );
    }
  }

  void signOut() async {
    if (state.googleState == null) return;
    try {
      await googleRepository.signOutWithGoogle();
      state = state.copyWith(googleState: null);
    } catch (error, stackTrace) {
      state = state.copyWith(
        googleState: AsyncError<GoogleState>(error, stackTrace)
            .copyWithPrevious(state.googleState!),
        loadingType: LoadingType.neutral,
      );
    }
  }

  void upload() async {
    if (state.googleState == null) return;
    if ((await customerRepository.loadAllCustomer()).isEmpty) {
      Get.rawSnackbar(message: '1人以上の顧客を登録してください');
      return;
    }

    state = state.copyWith(
      googleState: const AsyncLoading<GoogleState>()
          .copyWithPrevious(state.googleState!),
      loadingType: LoadingType.upload,
    );

    try {
      await googleRepository.uploadFileToGoogleDrive();
      final list = await googleRepository.listGoogleDriveFiles();

      state = state.copyWith(
        googleState: AsyncData(GoogleState(
          currentUser: state.googleState!.value!.currentUser,
          list: list!,
        )),
        loadingType: LoadingType.neutral,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        googleState: AsyncError<GoogleState>(error, stackTrace)
            .copyWithPrevious(state.googleState!),
        loadingType: LoadingType.neutral,
      );
    }
  }

  void download() async {
    if (state.googleState == null) return;

    state = state.copyWith(
      googleState: const AsyncLoading<GoogleState>()
          .copyWithPrevious(state.googleState!),
      loadingType: LoadingType.download,
    );

    try {
      await googleRepository.downloadGoogleDriveFile();
      final list = await googleRepository.listGoogleDriveFiles();

      state = state.copyWith(
        googleState: AsyncData(GoogleState(
          currentUser: state.googleState!.value!.currentUser,
          list: list!,
        )),
        loadingType: LoadingType.neutral,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        googleState: AsyncError<GoogleState>(error, stackTrace)
            .copyWithPrevious(state.googleState!),
        loadingType: LoadingType.neutral,
      );
    }
  }
}
