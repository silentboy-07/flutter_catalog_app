import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
    // ignore: unnecessary_null_comparison
    : assert(catalog != null); // null check

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          overflowAlignment: OverflowBarAlignment.start,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: WidgetStateProperty.all(const StadiumBorder()),
                minimumSize: WidgetStateProperty.all(
                  const Size(50, 50),
                ), // width, height
              ),
              child: "Buy".text
                  .color(Colors.white)
                  .make(), // xl makes text bigger
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
                  color: const Color(0xFFF5F5F5),
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "At gubergren amet at amet rebum, no erat elitr stet sanctus stet stet duo clita. Duo erat et lorem tempor amet. Ut lorem dolor labore magna gubergren, sed et sea tempor aliquyam sed. Gubergren eirmod amet kasd sanctus dolor magna aliquyam aliquyam. Et lorem et eirmod dolor amet, consetetur etc."
                          .text
                          .textStyle(context.captionStyle)
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
