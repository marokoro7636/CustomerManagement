import 'package:customer_management/ui/setting/setting_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(state.currentUser != null ? state.currentUser!.email : ''),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: viewModel.signIn,
            ),
            ElevatedButton(
              onPressed: viewModel.signOut,
              child: const Text('ログアウト'),
            ),
            ElevatedButton(onPressed: viewModel.p, child: const Text('表示'))
          ],
        ),
      ),
    );
  }
}
