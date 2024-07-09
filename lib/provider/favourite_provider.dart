import "package:flutter/foundation.dart";

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;
  void addItem(val) {
    _selectedItem.add(val);
    notifyListeners();
  }

  void removeItem(val) {
    _selectedItem.remove(val);
    notifyListeners();
  }
}
