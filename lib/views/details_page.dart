import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/cubits/cafe_details/cafe_details_cubit.dart';
import 'package:router_app/cubits/cafe_details/cafe_details_state.dart';
import 'package:router_app/cubits/favorites/favorites_cubit.dart';
import 'package:router_app/cubits/favorites/favorites_state.dart';
import 'package:router_app/data/model/cafe.dart';

@RoutePage()
class DetailsPage extends StatelessWidget implements AutoRouteWrapper {
  final String id;

  const DetailsPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: locator<FavoritesCubit>()..loadFavorites(),
        ),
        BlocProvider.value(
          value: locator<CafeDetailsCubit>()..loadCafe(id),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CafeDetailsCubit, CafeDetailsState>(
        builder: (context, state) {
          if (state.status == CafeDetailsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.cafe == null) {
            return const Center(
              child: Text('Café not found'),
            );
          }

          Cafe cafe = state.cafe!;

          return Scaffold(
            appBar: AppBar(
              title: Text(cafe.name),
              actions: [
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Icon(
                        state.isFavorite(cafe.id) ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () {
                        context.read<FavoritesCubit>().toggleFavorite(cafe.id);
                      },
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                    ),
                    child: Image.network(
                      cafe.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.local_cafe,
                            size: 100,
                            color: Colors.brown.shade300,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(cafe.name, style: Theme.of(context).textTheme.headlineMedium),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                spacing: 4,
                                children: [
                                  const Icon(Icons.star, size: 18, color: Colors.amber),
                                  Text(cafe.rating.toStringAsFixed(1),
                                      style: Theme.of(context).textTheme.titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 8,
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                const Icon(Icons.location_on, color: Colors.brown),
                                Expanded(
                                  child: Text(
                                    cafe.address,
                                  ),
                                ),
                              ],
                            ),
                            // Opening Hours
                            Row(
                              spacing: 8,
                              children: [
                                const Icon(Icons.access_time, color: Colors.brown),
                                Expanded(
                                  child: Text(
                                    cafe.hours,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  cafe.hasWifi ? Icons.wifi : Icons.wifi_off,
                                  color: cafe.hasWifi ? Colors.green : Colors.grey,
                                ),
                                Text(
                                  cafe.hasWifi ? 'Free WiFi available' : 'No WiFi',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cafe.description,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.5,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
