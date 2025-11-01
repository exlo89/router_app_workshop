import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/cubits/favorites/favorites_state.dart';
import 'package:router_app/data/model/cafe.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(String cafeId) {
    final currentIds = List<String>.from(state.favoriteIds);

    if (currentIds.contains(cafeId)) {
      currentIds.remove(cafeId);
    } else {
      currentIds.add(cafeId);
    }

    final favoriteCafes = Cafe.sampleCafes
        .where((cafe) => currentIds.contains(cafe.id))
        .toList();

    emit(state.copyWith(
      favoriteIds: currentIds,
      favoriteCafes: favoriteCafes,
    ));
  }

  void loadFavorites() {
    final favoriteCafes = Cafe.sampleCafes
        .where((cafe) => state.favoriteIds.contains(cafe.id))
        .toList();

    emit(state.copyWith(favoriteCafes: favoriteCafes));
  }
}
