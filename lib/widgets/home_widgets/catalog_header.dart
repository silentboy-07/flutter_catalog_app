import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if dark mode is active
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold
            .color(isDarkMode ? MyTheme.white : MyTheme.darkBluishColor)
            .make(),
        // .centered(),
        "Trending products".text.xl2
            // ignore: deprecated_member_use
            .color(isDarkMode ? MyTheme.white.withOpacity(0.8) : Colors.black87)
            .make(),
      ],
    );
  }
}
