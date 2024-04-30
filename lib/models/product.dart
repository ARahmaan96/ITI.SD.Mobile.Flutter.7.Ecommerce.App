class ProductModel {
  dynamic id;
  String title;
  dynamic price;
  String description;
  String image;
  RatingModel? rating;
  String category;
  ProductModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.description,
      required this.image,
      required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return jsonData == null
        ? RatingModel(rate: 0, count: 0)
        : RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
