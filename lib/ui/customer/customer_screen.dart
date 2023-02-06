import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerScreen extends HookConsumerWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客一覧'),
      ),
      body: const Center(
        child: Text('顧客一覧画面'),
      ),
    );
  }
}