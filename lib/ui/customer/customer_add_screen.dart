import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerAddScreen extends HookConsumerWidget {
  const CustomerAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の追加'),
      ),
      body: const Center(
        child: Text('顧客追加画面'),
      ),
    );
  }
}