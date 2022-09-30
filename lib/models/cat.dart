class CatModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 14 Pro",
        desc: "Super Retina XDR display footnote ",
        price: 129900,
        color: "#33505a",
        image:
            "https://imageio.forbes.com/specials-images/imageserve/616afa67334932a6d26729d2/Apple--iPhone--new-iPhone--iPhone-upgrade--iPhone-14--iPhone-14-Pro-Max--iPhone-13/960x0.jpg?height=519&width=711&fit=bounds")
  ];
}

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
