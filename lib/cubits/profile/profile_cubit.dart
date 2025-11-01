import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> fetchUserProfile(String username) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Simulate fetching user data
      emit(ProfileState(
        status: ProfileStatus.loaded,
        username: username,
        email: '$username@coffee-browser.com',
        bio: 'Coffee enthusiast and cafe explorer',
        favoritesCount: 0, // This will be updated from FavoritesCubit
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProfileStatus.error,
        errorMessage: 'Failed to load profile: $e',
      ));
    }
  }

  void updateFavoritesCount(int count) {
    emit(state.copyWith(favoritesCount: count));
  }

  void clearProfile() {
    emit(const ProfileState());
  }
}
