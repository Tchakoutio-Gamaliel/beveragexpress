class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name
  });

  factory Category.fromjson(Map<String, dynamic> json) {
    return Category(
      id: int.parse(json['Category_id'].toString()), 
      name: json['Category_name'].toString());
  }
}