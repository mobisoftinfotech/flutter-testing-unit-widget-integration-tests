import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/cart_item.dart';

void main() {
  late ShoppingCart cart;

  setUp(() {
    cart = ShoppingCart();
  });

  test('Add item to cart', () {
    final item = CartItem(name: 'Laptop', price: 1000.0, quantity: 1);
    cart.addItem(item);

    expect(cart.items.length, 1);
    expect(cart.items.first.name, 'Laptop');
    expect(cart.items.first.price, 1000.0);
    expect(cart.items.first.quantity, 1);
  });

  test('Remove item from cart', () {
    final item = CartItem(name: 'Laptop', price: 1000.0, quantity: 1);
    cart.addItem(item);
    cart.removeItem('Laptop');

    expect(cart.items.isEmpty, true);
  });

  test('Calculate total price of items in cart', () {
    final item1 = CartItem(name: 'Laptop', price: 1000.0, quantity: 1);
    final item2 = CartItem(name: 'Phone', price: 500.0, quantity: 2);

    cart.addItem(item1);
    cart.addItem(item2);

    expect(cart.calculateTotal(), 2000.0);
  });

  test('Clear cart', () {
    final item1 = CartItem(name: 'Laptop', price: 1000.0, quantity: 1);
    final item2 = CartItem(name: 'Phone', price: 500.0, quantity: 2);

    cart.addItem(item1);
    cart.addItem(item2);
    cart.clearCart();

    expect(cart.items.isEmpty, true);
  });
}
