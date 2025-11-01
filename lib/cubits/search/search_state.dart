part of 'search_cubit.dart';

@immutable
sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchResults extends SearchState {
  final List<Cafe> results;
  final String query;

  const SearchResults({
    required this.results,
    required this.query,
  });
}
