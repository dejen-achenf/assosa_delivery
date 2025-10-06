import 'package:flutter/foundation.dart';

class CartItem {
  final String id; // unique per variant/item
  final String title;
  final String imageAsset;
  final int unitPrice; // in minor currency (birr as int)
  int quantity;
  bool selected;

  CartItem({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.unitPrice,
    this.quantity = 1,
    this.selected = true,
  });

  int get totalPrice => unitPrice * quantity;
}

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _itemsById = {};

  List<CartItem> get items => _itemsById.values.toList(growable: false);

  void addItem(CartItem item) {
    if (_itemsById.containsKey(item.id)) {
      _itemsById[item.id]!.quantity += item.quantity;
    } else {
      _itemsById[item.id] = item;
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _itemsById.remove(id);
    notifyListeners();
  }

  void clearSelected() {
    _itemsById.removeWhere((key, value) => value.selected);
    notifyListeners();
  }

  void toggleSelect(String id, bool selected) {
    final item = _itemsById[id];
    if (item != null) {
      item.selected = selected;
      notifyListeners();
    }
  }

  void toggleSelectAll(bool selected) {
    for (final item in _itemsById.values) {
      item.selected = selected;
    }
    notifyListeners();
  }

  void changeQuantity(String id, int delta) {
    final item = _itemsById[id];
    if (item != null) {
      final next = item.quantity + delta;
      if (next >= 1) {
        item.quantity = next;
        notifyListeners();
      }
    }
  }

  int get totalSelectedPrice {
    return _itemsById.values
        .where((e) => e.selected)
        .fold(0, (sum, e) => sum + e.totalPrice);
  }

  bool get allSelected =>
      _itemsById.values.isNotEmpty &&
      _itemsById.values.every((e) => e.selected);
  bool get hasItems => _itemsById.isNotEmpty;
}
