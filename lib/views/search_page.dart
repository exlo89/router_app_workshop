import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/cubits/favorites/favorites_cubit.dart';
import 'package:router_app/cubits/favorites/favorites_state.dart';
import 'package:router_app/data/model/cafe.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Cafe> _searchResults = [];
  bool _hasSearched = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      _hasSearched = true;
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = Cafe.sampleCafes
            .where((cafe) =>
                cafe.name.toLowerCase().contains(query.toLowerCase()) ||
                cafe.address.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _hasSearched = false;
      _searchResults = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Search Field
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for cafes...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearSearch,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.brown.shade50,
              ),
              onChanged: _performSearch,
            ),
            const SizedBox(height: 20),

            // Search Results
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (!_hasSearched) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 80,
              color: Colors.brown.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'Search for cafes',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.brown.shade600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter a cafe name or location',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.brown.shade400,
                  ),
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.coffee_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No cafes found',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search term',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, favoritesState) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final cafe = _searchResults.elementAt(index);
            return CafeTile(
              cafe: cafe,
              onTap: () {
                context.router.push(DetailsRoute(cafe: cafe));
              },
              isFavorite: favoritesState.isFavorite(cafe.id),
              onFavouriteTap: () {
                BlocProvider.of<FavoritesCubit>(context).toggleFavorite(cafe.id);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16);
          },
          itemCount: _searchResults.length,
        );
      },
    );
  }
}
