import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
    // ignore: unnecessary_null_comparison
    : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? MyTheme.darkCreamColor
            : MyTheme.creamColor,
      ),
      backgroundColor:
          context.canvasColor, // creamColor (light), darkCreamColor (dark)
      bottomNavigationBar: Container(
        color: context.cardColor, // white (light), black (dark)
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          overflowAlignment: OverflowBarAlignment.start,
          children: [
            "\$${catalog.price}".text.bold.xl3
                .color(isDarkMode ? MyTheme.white : const Color(0xFF9E0C01))
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
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor, // white (light), black (dark)
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(
                            isDarkMode
                                ? MyTheme.white
                                : MyTheme.darkBluishColor,
                          )
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.theme.textTheme.labelSmall)
                          .xl
                          .color(
                            isDarkMode
                                // ignore: deprecated_member_use
                                ? MyTheme.white.withOpacity(0.8)
                                : Colors.black54,
                          )
                          .make(),
                      10.heightBox,
                      "At gubergren amet at amet rebum, no erat elitr stet sanctus stet stet duo clita. Duo erat et lorem tempor amet. Ut lorem dolor labore magna gubergren, sed et sea tempor aliquyam sed. Gubergren eirmod amet kasd sanctus dolor magna aliquyam aliquyam. Et lorem et eirmod dolor amet, consetetur etc."
                          .text
                          .textStyle(context.theme.textTheme.labelSmall)
                          .color(
                            isDarkMode
                                // ignore: deprecated_member_use
                                ? MyTheme.white.withOpacity(0.8)
                                : Colors.black54,
                          )
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
