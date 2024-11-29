import 'package:flutter/foundation.dart';

class Favorites extends ChangeNotifier {
  final List<String> _items = []; // Private list to store favorites

  List<String> get items => List.unmodifiable(_items); // Public getter

  void addItem(String item) {
    if (!_items.contains(item)) {
      _items.add(item);
      notifyListeners(); // Notify listeners when the list changes
    }
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners(); // Notify listeners when the list changes
  }
}
