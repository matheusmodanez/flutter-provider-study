import 'package:flutter/material.dart';

import 'catalogo.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.removeRange(0, _items.length);

    notifyListeners();
  }

  int get totalPrice =>
      _items.fold(0, (total, current) => total + current.preco);
}
