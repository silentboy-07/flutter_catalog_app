import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image, fit: BoxFit.cover, width: double.infinity)
        .box
        .rounded
        .p4
        .color(Colors.white)
        // .color(MyTheme.creamColor)
        .make()
        .p16()
        .w48(context);
  }
}
