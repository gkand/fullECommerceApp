import 'package:flutter/material.dart';

class WishList with ChangeNotifier {
  final String cartId;
  final String title;
  final String imageUrl;
  final double price;

  WishList({
    required this.cartId,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

class WishListProvider with ChangeNotifier {
  final Map<String, WishList> _wishList = {};

  Map<String, WishList> get wishList => _wishList;

  void addOrRemoveWishList(
      String productId, String title, String imageUrl, double price) {
    if (_wishList.containsKey(productId)) {
      removeItem(productId);
    } else {
      _wishList.putIfAbsent(
        productId,
        () => WishList(
          cartId: DateTime.now().toIso8601String(),
          title: title,
          imageUrl: imageUrl,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _wishList.remove(productId);
    notifyListeners();
  }

  void clearWishList() {
    _wishList.clear();
    notifyListeners();
  }
}
