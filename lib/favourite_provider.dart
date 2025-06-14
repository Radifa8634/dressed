import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products.dart';



class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favourites = [];

  List<Product> get favourites => _favourites;

  void toggleFavorite(Product product) {
    if (_favourites.contains(product)) {
      _favourites.remove(product);
    } else {
      _favourites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favourites.contains(product);
    return isExist;
  }

  static FavouriteProvider of(BuildContext context, {bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(context, listen: listen,
    );
  }
}
