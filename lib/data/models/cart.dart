class Cart {
  String id;
  String title;
  String imageUrl;
  String typeMeal;
  int count;
  double price;

  Cart(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.typeMeal,
      required this.count,
      required this.price});
}
