import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
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

    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.xl
                    .color(isDarkMode ? MyTheme.white : MyTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog.desc.text
                    .textStyle(context.theme.textTheme.labelSmall)
                    .color(
                      isDarkMode
                          // ignore: deprecated_member_use
                          ? MyTheme.white.withOpacity(0.8)
                          : Colors.black54,
                    )
                    .make(),
                10.heightBox,
                OverflowBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  overflowAlignment: OverflowBarAlignment.start,
                  children: [
                    "\$${catalog.price}".text.bold.xl
                        .color(isDarkMode ? MyTheme.white : Colors.black87)
                        .make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? MyTheme.lightBluishColor
                            : MyTheme.darkBluishColor,
                        foregroundColor: MyTheme.white,
                        shape: const StadiumBorder(),
                        minimumSize: const Size(50, 50),
                      ),
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(180).make().py16();
  }
}
