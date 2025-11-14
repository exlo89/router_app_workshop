import 'package:equatable/equatable.dart';
import 'package:router_app/data/model/cafe.dart';

enum CafeDetailsStatus { initial, loading, loaded, error }

class CafeDetailsState extends Equatable {
  final CafeDetailsStatus status;
  final Cafe? cafe;
  final String? errorMessage;

  const CafeDetailsState({
    this.status = CafeDetailsStatus.initial,
    this.cafe,
    this.errorMessage,
  });

  CafeDetailsState copyWith({
    CafeDetailsStatus? status,
    Cafe? cafe,
    String? errorMessage,
  }) {
    return CafeDetailsState(
      status: status ?? this.status,
      cafe: cafe ?? this.cafe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, cafe, errorMessage];
}
