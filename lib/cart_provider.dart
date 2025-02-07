import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void addToCart(Map<String, dynamic> book) {
    int index = _cartItems.indexWhere((item) => item["title"] == book["title"]);
    if (index != -1) {
      _cartItems[index]["quantity"] += 1;
    } else {
      _cartItems.add({...book, "quantity": 1});
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
