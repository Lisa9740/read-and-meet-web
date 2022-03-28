import 'dart:convert';

String ProductToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

List<Product> ProductFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product{
  final int? id;
  final String name;
  final String description;
  final String? image;
  final price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name':name,
      'description': description,
      'image' : image,
      'price' : price,
    };
  }
}