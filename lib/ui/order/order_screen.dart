import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderScreen extends HookConsumerWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注文一覧'),
      ),
      body: const Center(
        child: Text('注文一覧画面'),
      ),
    );
  }
}