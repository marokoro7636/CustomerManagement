import 'package:customer_management/ui/setting//setting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleBackupProvider =
StateNotifierProvider<SettingViewModel, SettingState>(
        (ref) => SettingViewModel());

class SettingViewModel extends StateNotifier<SettingState> {
  SettingViewModel() : super(const SettingState());



}
