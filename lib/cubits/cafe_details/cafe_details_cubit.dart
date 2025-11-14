import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/cubits/cafe_details/cafe_details_state.dart';
import 'package:router_app/data/model/cafe.dart';

class CafeDetailsCubit extends Cubit<CafeDetailsState> {
  CafeDetailsCubit() : super(const CafeDetailsState());

  void loadCafe(String id) {
    emit(state.copyWith(status: CafeDetailsStatus.loading));

    try {
      final cafe = Cafe.sampleCafes.firstWhere(
            (c) => c.id == id,
        orElse: () => throw Exception('Café with ID $id not found'),
      );

      emit(state.copyWith(
        status: CafeDetailsStatus.loaded,
        cafe: cafe,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CafeDetailsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
