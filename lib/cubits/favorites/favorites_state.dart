import 'package:equatable/equatable.dart';
import 'package:router_app/data/model/cafe.dart';

class FavoritesState extends Equatable {
  final List<String> favoriteIds;
  final List<Cafe> favoriteCafes;

  const FavoritesState({
    this.favoriteIds = const [],
    this.favoriteCafes = const [],
  });

  FavoritesState copyWith({
    List<String>? favoriteIds,
    List<Cafe>? favoriteCafes,
  }) {
    return FavoritesState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
      favoriteCafes: favoriteCafes ?? this.favoriteCafes,
    );
  }

  bool isFavorite(String cafeId) {
    return favoriteIds.contains(cafeId);
  }

  @override
  List<Object?> get props => [favoriteIds, favoriteCafes];
}
