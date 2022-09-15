class FoodModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final String rating;
  final String type;

  FoodModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.type,
    required this.id,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      rating: json['rating'],
      type: json['type'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'rating': rating,
      'type': type,
      'id': id,
    };
  }
}
