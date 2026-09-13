import '../models/cart_item.dart';

class Cartservice {
  final List<CartItem> _items = [];

  //get all cart items
  List<CartItem> get items => _items;

  //add a product to the cart
  void addItem(CartItem item) {
    final index = _items.indexWhere(
      (cartItem) => cartItem.id == item.id,
    );

    if (index != -1) {
      //product already exist
      _items[index].quantity += item.quantity;
    } else {
      // product do not exist
      _items.add(item);
    }
  }

  //remove a product completletely
  void removeItem(int id) {
    _items.removeWhere(
      (item) => item.id == id,
    );
  }

  //increase quantity
  void increaseQuantity(int id) {
    final index = _items.indexWhere(
      (item) => item.id == id,
    );

    if (index != -1) {
      _items[index].quantity++;
    }
  }

  //decrease quantity
  void decreaseQuantity(int id) {
    final index = _items.indexWhere(
      (item) => item.id == id,
    );

    if(index != -1) {
      if(_items[index].quantity > 1) {
        _items[index].quantity--;
      }
    }
  }

  //calculate total price
  int get total {
    int total = 0;

    for (final item in _items) {
      total += item.total;
    }

    return total;
  }

  //number of products int the cart
  int get itemCount {
    int count = 0;

    for (final item in _items) {
      count += item.quantity;
    }

    return count;
  }

  //empty the cart
  void clearCart() {
    _items.clear();
  }
}

final cartservice = Cartservice();