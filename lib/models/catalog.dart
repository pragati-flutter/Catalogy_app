class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 15 Pro",
        price: 999,
        color: "333505a",
        image:
            "https://imgs.search.brave.com/W5f-HNb62RpIxrLKYX42Mf34Kkrf4ia9ys227b3OfPk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90LW1v/YmlsZS5zY2VuZTcu/Y29tL2lzL2ltYWdl/L1RtdXNwcm9kL0Fw/cGxlLWlQaG9uZS0x/NS1Qcm8tQmx1ZS1U/aXRhbml1bS1yaWdo/dGltYWdl"),
  ];
}
