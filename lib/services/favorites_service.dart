import 'package:flutter/foundation.dart';
import 'package:router_app/data/model/cafe.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() {
    return _instance;
  }

  FavoritesService._internal();

  final List<String> _favoriteIds = [];

  List<String> get favoriteIds => List.unmodifiable(_favoriteIds);

  bool isFavorite(String cafeId) {
    return _favoriteIds.contains(cafeId);
  }

  void toggleFavorite(String cafeId) {
    if (_favoriteIds.contains(cafeId)) {
      _favoriteIds.remove(cafeId);
    } else {
      _favoriteIds.add(cafeId);
    }
    notifyListeners();
  }

  List<Cafe> getFavoriteCafes() {
    return Cafe.sampleCafes.where((cafe) => _favoriteIds.contains(cafe.id)).toList();
  }
}
