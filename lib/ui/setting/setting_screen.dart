import 'package:customer_management/ui/setting/setting_state.dart';
import 'package:customer_management/ui/setting/setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingProvider);
    final viewModel = ref.watch(settingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: Center(
        child: state.when(
          skipLoadingOnRefresh: false,
          data: (_) {
            if (state.value!.loadType != null) {
              late String message;
              if (state.value!.loadType!.index == LoadType.upload.index) {
                message = 'アップロードが完了しました';
              } else if (state.value!.loadType!.index ==
                  LoadType.download.index) {
                message = 'ダウンロードが完了しました';
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                viewModel.resetLoadType();
              });
            }
            return const _SettingScreenBase();
          },
          error: (e, s) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('エラーが発生しました。もう一度お試しください。')));
            });
            return const _SettingScreenBase();
          },
          loading: () {
            late String message;
            if (state.value!.loadType!.index == LoadType.upload.index) {
              message = 'アップロード中です';
            } else if (state.value!.loadType!.index ==
                LoadType.download.index) {
              message = 'ダウンロード中です';
            }

            return Stack(
              children: [
                const _SettingScreenBase(),
                const Center(
                  child: ColoredBox(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                Center(child: Text(message)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SettingScreenBase extends HookConsumerWidget {
  const _SettingScreenBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingProvider);
    final viewModel = ref.watch(settingProvider.notifier);

    return Column(
      children: [
        const SizedBox(height: 20),
        state.value!.currentUser != null
            ? ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: state.value!.currentUser!,
                ),
                title: Text(state.value!.currentUser!.displayName ?? ''),
                subtitle: Text(state.value!.currentUser!.email),
              )
            : const Text('サインインしていません'),
        const SizedBox(height: 20),
        if (state.value!.list != null)
          state.value!.list!.files!.isNotEmpty
              ? Text(
                  '最終更新:${state.value!.list!.files![0].modifiedTime!.toLocal()}')
              : const Text('バックアップデータがありません'),
        const SizedBox(height: 20),
        state.value!.currentUser != null
            ? ElevatedButton(
                onPressed: viewModel.signOut,
                child: const Text('ログアウト'),
              )
            : SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: viewModel.signIn,
              ),
        const SizedBox(height: 20),
        if (state.value!.currentUser != null)
          ElevatedButton(
            onPressed: viewModel.upload,
            child: const Text('アップロード'),
          ),
        const SizedBox(height: 20),
        if (state.value!.currentUser != null &&
            state.value!.list != null &&
            state.value!.list!.files!.isNotEmpty)
          ElevatedButton(
            onPressed: viewModel.download,
            child: const Text('ダウンロード'),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: viewModel.infoForDebug,
          child: const Text('表示'),
        ),
      ],
    );
  }
}
