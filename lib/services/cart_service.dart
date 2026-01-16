import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  bool get isEmpty => _items.isEmpty;

  void addToCart(Product product, {String? color, String? size, int quantity = 1}) {
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedColor == color &&
          item.selectedSize == size,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(
        product: product,
        quantity: quantity,
        selectedColor: color,
        selectedSize: size,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(String productId, {String? color, String? size}) {
    _items.removeWhere(
      (item) =>
          item.product.id == productId &&
          item.selectedColor == color &&
          item.selectedSize == size,
    );
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity, {String? color, String? size}) {
    final index = _items.indexWhere(
      (item) =>
          item.product.id == productId &&
          item.selectedColor == color &&
          item.selectedSize == size,
    );
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

