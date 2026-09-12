class Product {
  final int id;
  final String name;
  final int price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });

  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json["Product_id"].toString()),
      name: json['Product_name'].toString(),
      price: int.parse(json['Price'].toString()),
      image: json['Image'].toString(),
      );
  }
}