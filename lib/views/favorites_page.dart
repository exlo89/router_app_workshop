import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/cubits/favorites/favorites_cubit.dart';
import 'package:router_app/cubits/favorites/favorites_state.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget implements AutoRouteWrapper {
  const FavoritesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: locator<FavoritesCubit>()..loadFavorites(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favoriteCafes.isEmpty) {
            return Center(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  Text(
                    'No favorites yet!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  Text(
                    'Start adding cafes to your favorites',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final cafe = state.favoriteCafes.elementAt(index);
                return CafeTile(
                  cafe: cafe,
                  onTap: () {
                    context.router.navigate(DetailsRoute(id: cafe.id));
                  },
                  isFavorite: state.isFavorite(cafe.id),
                  onFavouriteTap: () {
                    BlocProvider.of<FavoritesCubit>(context).toggleFavorite(cafe.id);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: state.favoriteCafes.length,
            ),
          );
        },
      ),
    );
  }
}
