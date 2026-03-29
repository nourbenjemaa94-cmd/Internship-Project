import 'package:flutter/material.dart';
import './global_variables.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> favorites = [];

  void addFavorite(Product product) {
    if (!favorites.contains(product)) {
      favorites.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(Product product) {
    favorites.remove(product);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }
}
