import 'package:flutter/material.dart';
import 'package:flutter_catalog/theme_notifier.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is active
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + Toggle Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Wrap text in Flexible to prevent overflow
            Flexible(
              child: "Catalog App"
                  .text
                  .xl4
                  .bold // Reduced from xl5 to xl4
                  .color(isDarkMode ? MyTheme.white : MyTheme.darkBluishColor)
                  .make(),
            ),
            // Theme Toggle Icon with reduced size
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.wb_sunny : Icons.nights_stay,
                color: isDarkMode ? Colors.yellow : Colors.blueGrey,
                size: 20, // Reduce icon size (default is 24)
              ),
              padding: EdgeInsets.zero, // Remove default padding
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ), // Reduce touch target size
              onPressed: () {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
        "Trending products".text.xl2
            .color(isDarkMode ? MyTheme.white.withOpacity(0.8) : Colors.black87)
            .make(),
      ],
    );
  }
}
