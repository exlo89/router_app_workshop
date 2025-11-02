import 'package:get_it/get_it.dart';
import 'package:router_app/cubits/auth/auth_cubit.dart';
import 'package:router_app/cubits/favorites/favorites_cubit.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit());
  locator.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());
}
