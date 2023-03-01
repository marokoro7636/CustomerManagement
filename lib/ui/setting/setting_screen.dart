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

    return state.when(
      data: (data) {
        return !state.isRefreshing
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('設定'),
                ),
                body: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      data.currentUser != null
                          ? ListTile(
                              leading: GoogleUserCircleAvatar(
                                identity: data.currentUser!,
                              ),
                              title: Text(data.currentUser!.displayName ?? ''),
                              subtitle: Text(data.currentUser!.email),
                            )
                          : const Text('サインインしていません'),
                      const SizedBox(height: 20),
                      data.currentUser != null
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
                      ElevatedButton(
                        onPressed:
                            data.currentUser != null ? viewModel.upload : null,
                        child: const Text('アップロード'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: data.currentUser != null
                            ? viewModel.download
                            : null,
                        child: const Text('ダウンロード'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: viewModel.infoForDebug,
                        child: const Text('表示'),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      // TODO エラー時の動作
      error: (error, stacktrace) => Center(
        child: Text(error.toString()),
      ),
      // TODO ローディング時の動作
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
