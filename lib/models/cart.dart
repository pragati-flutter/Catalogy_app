import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //catalog field
  //CatalogModel? _catalog;

  //collection of ids = store id of each item
  final List<int> _itemIds = [];

  //CatalogModel get catalog => _catalog ?? CatalogModel();

  // set catalog(CatalogModel? newCatalog) {
  //   assert(newCatalog != null);
  //   _catalog = newCatalog;
  // }

  List<Item?> get items => _itemIds.map((id) => CatalogModel().getById(id)).toList();

//Get  total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + (current?.price ?? 12));

//add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
