import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void toggleFavorite(int index) {
    if (_selectedItem.contains(index)) {
      _selectedItem.remove(index);
    } else {
      _selectedItem.add(index);
    }
    notifyListeners();
  }
}
