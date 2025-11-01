import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/cubits/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<bool> login(String username, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple validation: just check if fields are not empty
    if (username.isNotEmpty && password.isNotEmpty) {
      emit(AuthState(
        status: AuthStatus.authenticated,
        username: username,
      ));
      return true;
    }

    emit(const AuthState(status: AuthStatus.unauthenticated));
    return false;
  }

  Future<void> logout() async {
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }
}
