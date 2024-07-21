import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  User? _user;

  List<CartItem> get items => _items;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  void addProductToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0.0, (total, item) => total + item.product.price * item.quantity);
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
