class Productinfo {
  final int id;
  final String name;
  final int price;
  final String image;
  final String description;

  Productinfo({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory Productinfo.fromjson(Map<String, dynamic> json) {
    return Productinfo(
      id: int.parse(json["Product_id"].toString()), 
      name: json["Product_name"].toString(), 
      image: json["Image"].toString(), 
      description: json["description"].toString(), 
      price: int.parse(json["Price"].toString())
      );
  }
}