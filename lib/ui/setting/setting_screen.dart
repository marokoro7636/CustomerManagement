import 'package:customer_management/ui/setting/setting_state.dart';
import 'package:customer_management/ui/setting/setting_viewmodel.dart';
import 'package:customer_management/util/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingProvider);
    final viewModel = ref.watch(settingProvider.notifier);

    ref.listen(settingProvider, (previous, next) {
      // エラー時の処理
      next.googleState?.whenOrNull(
        error: (e, s) => Get.rawSnackbar(message: 'エラーが発生しました。もう一度お試しください。'),
      );

      // アップロードが始まった時
      if (previous?.loadingType == LoadingType.neutral &&
          next.loadingType == LoadingType.upload) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: const SimpleDialog(
              title: Text('データをバックアップ中'),
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(36),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // アップロードが終わった時
      if (previous?.loadingType == LoadingType.upload &&
          next.loadingType == LoadingType.neutral) {
        Get.back();
        Get.rawSnackbar(message: 'アップロードが完了しました');
      }

      // ダウンロードが始まった時
      if (previous?.loadingType == LoadingType.neutral &&
          next.loadingType == LoadingType.download) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
            onWillPop: () async => false,
            child: const SimpleDialog(
              title: Text('データを復元中'),
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(36),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // ダウンロードが終わった時
      if (previous?.loadingType == LoadingType.download &&
          next.loadingType == LoadingType.neutral) {
        Get.back();
        Get.rawSnackbar(message: 'ダウンロードが完了しました');
      }
    });

    final textStyle = TextStyle(
      fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
    );

    final settingsThemeData = SettingsThemeData(
      settingsListBackground: Theme.of(context).colorScheme.background,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        lightTheme: settingsThemeData,
        darkTheme: settingsThemeData,
        sections: [
          SettingsSection(
            title: Text('バックアップ', style: textStyle),
            tiles: [
              if (state.googleState != null)
                SettingsTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.googleState!.value!.currentUser.displayName ?? '',
                        style: textStyle,
                      ),
                      Text(
                        state.googleState!.value!.currentUser.email,
                        style: textStyle,
                      ),
                    ],
                  ),
                  leading: GoogleUserCircleAvatar(
                    identity: state.googleState!.value!.currentUser,
                  ),
                ),
              SettingsTile.switchTile(
                title: Text('Google Driveへのバックアップ', style: textStyle),
                initialValue: state.googleState != null,
                onToggle: (value) {
                  if (value) {
                    viewModel.signIn();
                  } else {
                    viewModel.signOut();
                  }
                },
              ),
              if (state.googleState != null)
                SettingsTile(
                  title: Text('今すぐバックアップ', style: textStyle),
                  description: Text(
                    '最終バックアップ日時 : '
                    '${state.googleState!.value!.list.files!.isNotEmpty ? state.googleState!.value!.list.files![0].modifiedTime!.toLocal().toBackupString() : 'データなし'}',
                    style: textStyle,
                  ),
                  leading: const Icon(Icons.upload),
                  onPressed: (context) {
                    viewModel.upload();
                  },
                ),
              if (state.googleState != null &&
                  state.googleState!.value!.list.files!.isNotEmpty)
                SettingsTile(
                  title: Text('データを復元', style: textStyle),
                  description: Text(
                    'Google Driveからデータを復元します',
                    style: textStyle,
                  ),
                  leading: const Icon(Icons.download),
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('データを復元しますか'),
                        content:
                            const Text('現在のデータが上書きされます。一度復元した場合は元に戻すことはできません。'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              viewModel.download();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
          SettingsSection(
            title: Text('アプリ情報', style: textStyle),
            tiles: [
              SettingsTile(
                title: Text('オープンソースライセンス', style: textStyle),
                onPressed: (context) => showLicensePage(
                  context: context,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
