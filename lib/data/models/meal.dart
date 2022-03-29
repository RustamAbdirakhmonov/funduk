class Meal {
  int id;
  String title;
  String typeMeal;
  String subType;
  List<String> ingriedent;
  String description;
  double cost;
  String imageUrl;
  String videoId;
  Meal(
      {
        required this.id,
        required this.title,
      required this.typeMeal,
      required this.subType,
      required this.ingriedent,
      required this.description,
      required this.cost,
      required this.imageUrl,
      required this.videoId,

      });
}
