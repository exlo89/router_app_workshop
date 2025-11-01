import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:router_app/data/model/cafe.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchInitial());

  void search(String query) {
    if (query.isEmpty) {
      emit(const SearchResults(results: [], query: ''));
    } else {
      final results = Cafe.sampleCafes
          .where((cafe) =>
              cafe.name.toLowerCase().contains(query.toLowerCase()) ||
              cafe.address.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SearchResults(results: results, query: query));
    }
  }

  void reset() {
    emit(const SearchInitial());
  }
}
