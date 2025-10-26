import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/data/model/cafe.dart';
import 'package:router_app/services/favorites_service.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  final String filter;

  const HomePage({@QueryParam('filter') this.filter = '', super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FavoritesService _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    _favoritesService.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Cafe> cafes = [];

    if (widget.filter.isNotEmpty) {
      cafes = Cafe.sampleCafes.where((cafe) => cafe.name.toLowerCase().contains(widget.filter.toLowerCase())).toList();
    } else {
      cafes = Cafe.sampleCafes;
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final cafe = cafes.elementAt(index);
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
        itemCount: cafes.length,
      ),
    );
  }
}
