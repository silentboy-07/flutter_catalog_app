// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        //  Web / Tablet layout (Grid) with scrolling
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 1.2, //  keeps cards proportional
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          ).py24()
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(), //  allow smooth scroll
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          ).py24();
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Safe text with wrapping
            catalog.name.text.xl
                .maxLines(1)
                .overflow(TextOverflow.ellipsis)
                .color(isDarkMode ? MyTheme.white : MyTheme.darkBluishColor)
                .bold
                .make(),
            catalog.desc.text
                .textStyle(context.theme.textTheme.labelSmall)
                .color(
                  isDarkMode ? MyTheme.white.withOpacity(0.8) : Colors.black54,
                )
                .maxLines(2)
                .overflow(TextOverflow.ellipsis)
                .make(),
            10.heightBox,
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              overflowAlignment: OverflowBarAlignment.start,
              children: [
                "\$${catalog.price}".text.bold.xl
                    .color(isDarkMode ? MyTheme.white : Colors.black87)
                    .make(),
                AddToCart(catalog: catalog, isDarkMode: isDarkMode),
              ],
            ).pOnly(right: 8.0),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];

    return VxBox(
      child: context.isMobile
          ? Row(children: children2)
          : Column(children: children2),
    ).color(context.cardColor).rounded.py16.make().py32();
  }
}
