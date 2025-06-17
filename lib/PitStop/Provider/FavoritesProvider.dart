import 'package:flutter/foundation.dart';
import 'package:main_projects/PitStop/Model/carmodel.dart';


class FavoritesProvider with ChangeNotifier {
  final List<Car> _favorites = [];

  List<Car> get favorites => _favorites;

  void toggleFavorite(Car car) {
    final isExist = _favorites.any((c) => c.name == car.name);
    if (isExist) {
      _favorites.removeWhere((c) => c.name == car.name);
    } else {
      _favorites.add(car);
    }
    notifyListeners();
  }

  bool isFavorite(Car car) {
    return _favorites.any((c) => c.name == car.name);
  }
}

