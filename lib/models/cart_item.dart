

class CartItem {
  final int id;
  final String name;
  final String image;
  final int price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity
  });

  int get total => price * quantity;
  
  //convert Cartitem to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  //Convert json back to cartitem
  factory CartItem.fromjson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'], 
      name: json['name'], 
      image: json['image'], 
      price: json['price'], 
      quantity: json['quantity'],
      );
  }
}