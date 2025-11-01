import 'package:equatable/equatable.dart';

enum AuthStatus { authenticated, unauthenticated, loading }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? username;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.username,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? username,
  }) {
    return AuthState(
      status: status ?? this.status,
      username: username ?? this.username,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.loading;

  @override
  List<Object?> get props => [status, username];
}
