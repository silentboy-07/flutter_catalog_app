import 'package:flutter/foundation.dart';
import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalog;

  //Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item?> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current!.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
