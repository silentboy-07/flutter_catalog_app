import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  final bool isDarkMode;

  const AddToCart({super.key, required this.catalog, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    VxState.watch(
      context,
      on: [AddMutation, RemoveMutation],
    ); // Replaced listen with watch
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog); // Just instantiating is enough
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isDarkMode
            ? MyTheme.lightBluishColor
            : MyTheme.darkBluishColor,
        foregroundColor: MyTheme.white,
        shape: const StadiumBorder(),
        minimumSize: const Size(30, 40), // Matches HomeDetailPage .wh(100, 50)
      ),
      child: isInCart
          ? const Icon(Icons.done, size: 25)
          : const Icon(CupertinoIcons.cart_badge_plus, size: 30),
    );
  }
}
