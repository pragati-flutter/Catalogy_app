import 'package:flutter_catalog/core/core.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
CatalogModel ? _catalog;
//collection of ids = store id of each item
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog ?? CatalogModel();
  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  List<Item?> get items {
    return _itemIds.map((id) {
      return CatalogModel().getById(id);

    }).toList();
  }
  //Get  total price
  num get totalPrice {
    return items.fold(0, (total, current) => total + (current?.price ?? 12));
  }
}
class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
     late final Item item;
     RemoveMutation(this.item);
     @override
     perform() {
       store?.cart._itemIds.remove(item.id);
     }
}
