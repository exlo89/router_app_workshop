import 'package:equatable/equatable.dart';

enum ProfileStatus { initial, loading, loaded, error }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final String? username;
  final String? email;
  final String? bio;
  final int favoritesCount;
  final String? errorMessage;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.username,
    this.email,
    this.bio,
    this.favoritesCount = 0,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    String? username,
    String? email,
    String? bio,
    int? favoritesCount,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      favoritesCount: favoritesCount ?? this.favoritesCount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == ProfileStatus.loading;
  bool get isLoaded => status == ProfileStatus.loaded;
  bool get hasError => status == ProfileStatus.error;

  @override
  List<Object?> get props => [status, username, email, bio, favoritesCount, errorMessage];
}
