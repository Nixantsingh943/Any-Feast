import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';

class TopNavbar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Image.asset(
            'lib/images/logo.png',
            height: 32,
          ),
          const SizedBox(width: 10),
          const Text(
            'AnyFeast',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () {
            themeNotifier.value =
                isDark ? ThemeMode.light : ThemeMode.dark;
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}