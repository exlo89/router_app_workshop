import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/cubits/favorites/favorites_cubit.dart';
import 'package:router_app/cubits/favorites/favorites_state.dart';
import 'package:router_app/data/model/cafe.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  final String filter;

  const HomePage({@QueryParam('filter') this.filter = '', super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: locator<FavoritesCubit>()..loadFavorites(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Cafe> cafes = [];

    if (filter.isNotEmpty) {
      cafes = Cafe.sampleCafes
          .where((cafe) => cafe.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    } else {
      cafes = Cafe.sampleCafes;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Browser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final cafe = cafes.elementAt(index);
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
              itemCount: cafes.length,
            );
          },
        ),
      ),
    );
  }
}
