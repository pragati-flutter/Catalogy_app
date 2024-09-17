class Item {
   int ? id;
   String ? name;
  String ? desc;
   num ? price;
  String ? color;
  String ? image;

  Item(
      { this.id,
      this.name,
    this.desc,
      this.price,
      this.color,
       this.image}
      );
  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
      id:map["id"],
      name:map["name"],
      desc:map["desc"],
      price:map["price"],
      color:map["color"],
      image:map["image"],
    );
  }
}

class CatalogModel {
  static List<Item> items = [


  ];


}




