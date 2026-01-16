import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_service.dart';

class FavoriteService extends ChangeNotifier {
  final List<String> _favoriteIds = [];

  List<String> get favoriteIds => _favoriteIds;
  bool get isEmpty => _favoriteIds.isEmpty;
  int get count => _favoriteIds.length;

  bool isFavorite(String productId) {
    return _favoriteIds.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (_favoriteIds.contains(productId)) {
      _favoriteIds.remove(productId);
    } else {
      _favoriteIds.add(productId);
    }
    notifyListeners();
  }

  void addFavorite(String productId) {
    if (!_favoriteIds.contains(productId)) {
      _favoriteIds.add(productId);
      notifyListeners();
    }
  }

  void removeFavorite(String productId) {
    _favoriteIds.remove(productId);
    notifyListeners();
  }

  List<Product> getFavoriteProducts() {
    final allProducts = ProductService.getProducts();
    return allProducts.where((product) => _favoriteIds.contains(product.id)).toList();
  }
}

