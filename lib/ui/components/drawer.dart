import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('CustomerManager'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          label: Text("ホーム"),
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings_outlined),
          label: Text("設定"),
          selectedIcon: Icon(Icons.settings),
        ),
      ],
      onDestinationSelected: (index) {
        onDestinationSelected(index);
      },
    );
  }
}
