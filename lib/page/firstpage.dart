import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab7_058/providers/counter_notifier.dart';
import 'package:lab7_058/providers/theme_notifier.dart';

class Firstpage extends ConsumerWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              icon: Icon(Icons.remove_circle, size: 32),
            ),

            const SizedBox(width: 16),

            Text(counter.toString()),

            const SizedBox(width: 16),

            IconButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              icon: Icon(Icons.add_circle, size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
