import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/cubits/auth/auth_cubit.dart';
import 'package:router_app/cubits/profile/profile_cubit.dart';
import 'package:router_app/cubits/profile/profile_state.dart';

@RoutePage()
class ProfilePage extends StatelessWidget implements AutoRouteWrapper {
  const ProfilePage({
    super.key,
    @QueryParam('isAdmin') this.isAdmin = false,
    required this.username,
  });

  final String username;
  final bool isAdmin;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) {
        final cubit = locator<ProfileCubit>();
        cubit.fetchUserProfile(username);
        return cubit;
      },
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isAdmin) ...[
                  Text(
                    'Admin Access Granted',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                ],
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.brown.shade300,
                              child: Text(
                                state.username?.substring(0, 1).toUpperCase() ?? 'U',
                                style: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.username ?? 'Unknown User',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    state.email ?? 'No email',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color: Colors.brown.shade600,
                                        ),
                                  ),
                                  if (state.bio != null) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      state.bio!,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Notifications'),
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Logout', style: TextStyle(color: Colors.red)),
                        onTap: () async {
                          await context.read<AuthCubit>().logout();
                          if (context.mounted) {
                            context.router.replace(const LoginRoute());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
