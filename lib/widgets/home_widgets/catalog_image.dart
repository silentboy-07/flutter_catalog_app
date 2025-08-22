import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // Image is fully loaded
              return child;
            }
            // Show loading indicator while image is loading
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
                color: isDarkMode ? MyTheme.white : MyTheme.darkBluishColor,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            // Show error icon if image fails to load
            return Icon(
              Icons.broken_image,
              size: 40,
              color: isDarkMode
                  ? MyTheme.white.withOpacity(0.8)
                  : Colors.black54,
            ).centered();
          },
        ).box.rounded.p4
        .color(context.canvasColor)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 48 : 20);
  }
}
