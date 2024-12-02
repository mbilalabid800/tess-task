import 'package:flutter/material.dart';

class DockProvider extends ChangeNotifier {
  final List<IconData> _items = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];

  List<IconData> get items => List.unmodifiable(_items);

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // Adjust the new index to account for the shifting caused by removal
      newIndex -= 1;
    }

    final item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);

    notifyListeners();
  }
}
