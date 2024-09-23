class Item {
  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
}

class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items = [];

  Item getById(int id) {
    print("...catalog items -> $items");
    return items.firstWhere((element) {
      return element.id == id;
    });
  }

  Item getByPosition(int pos) {
    return items[pos];
  }
}
