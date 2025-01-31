class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({required this.name, required this.price, required this.quantity});

  double get total => price * quantity;
}

class ShoppingCart {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
  }

  double calculateTotal() {
    return _items.fold(0.0, (total, item) => total + item.total);
  }

  void clearCart() {
    _items.clear();
  }
}
