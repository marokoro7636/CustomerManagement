import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderUserScreen extends HookConsumerWidget {
  const OrderUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('xxさんの注文一覧'),
      ),
      body: const Center(
        child: Text('注文一覧画面'),
      ),
    );
  }
}