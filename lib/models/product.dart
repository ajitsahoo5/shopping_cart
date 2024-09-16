class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  bool isFavorite = false;

  Product({required this.id, required this.name, required this.price, required this.image, required this.description,});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], 
      name: json['title'] as String, 
      price: double.parse('${json['price']}'), 
      image: json['image'] as String, 
      description: json['description'] as String,
    );
  }
}