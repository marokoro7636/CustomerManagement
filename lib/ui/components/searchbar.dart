import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBar extends HookConsumerWidget {
  const SearchBar({
    Key? key,
    this.openDrawer,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final void Function()? openDrawer;
  final void Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: const BoxConstraints(minWidth: 360, maxWidth: 720),
      width: double.infinity,
      height: 56,
      child: Material(
        elevation: 3,
        color: colorScheme.surface,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        borderRadius: BorderRadius.circular(56 / 2),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(56 / 2),
          highlightColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                if (openDrawer != null)
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: openDrawer,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextField(
                      controller: controller,
                      cursorColor: colorScheme.primary,
                      style: textTheme.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8),
                        hintText: '検索',
                        hintStyle: textTheme.bodyLarge?.apply(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
