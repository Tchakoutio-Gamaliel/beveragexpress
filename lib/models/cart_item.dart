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
}