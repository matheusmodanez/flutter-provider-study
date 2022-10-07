import 'package:flutter/material.dart';

import 'catalogo.dart';

class ComprasModel extends ChangeNotifier {
  final List<ItemsComprados> _items = [];

  List<ItemsComprados> get items => _items;

  void add(ItemsComprados itemsComprados) {
    _items.add(itemsComprados);
    notifyListeners();
  }

  void remove(ItemsComprados itemsComprados) {
    _items.remove(itemsComprados);
    notifyListeners();
  }
}

class ItemsComprados {
  List<Item> items = [
    Item(1, 'Nike Blue', 'Nike', '1', 360),
    Item(2, 'Air Max', 'Nike', '2', 500),
    Item(3, 'Max 270', 'Nike', '3', 450),
    Item(4, 'Air Max 270', 'Nike', '4', 600),
    Item(5, 'Run Didas', 'Adidas', '5', 470),
    Item(6, 'Black Runner', 'Adidas', '6', 400),
  ];

  ItemsComprados(this.items);
}
