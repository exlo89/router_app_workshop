import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/services/favorites_service.dart';

@RoutePage()
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesService _favoritesService = FavoritesService();
  final favoriteCafes = [];

  @override
  void initState() {
    super.initState();
    _favoritesService.addListener(_onFavoritesChanged);
    favoriteCafes.addAll(_favoritesService.getFavoriteCafes());
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {
      favoriteCafes.clear();
      favoriteCafes.addAll(_favoritesService.getFavoriteCafes());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoriteCafes.isEmpty
          ? Center(
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
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final cafe = favoriteCafes.elementAt(index);
                  return CafeTile(
                    cafe: cafe,
                    onTap: () {
                      context.router.navigate(DetailsRoute(cafe: cafe));
                    },
                    isFavorite: _favoritesService.isFavorite(cafe.id),
                    onFavouriteTap: () {
                      setState(() {
                        _favoritesService.toggleFavorite(cafe.id);
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
                itemCount: favoriteCafes.length,
              ),
            ),
    );
  }
}
