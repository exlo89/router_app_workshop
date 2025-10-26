import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              Icons.coffee,
              size: 100,
              color: Colors.brown[400],
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              'Coffee Browser',
              style: Theme.of(context).textTheme.displaySmall
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Version 2.0.0',
              style: Theme.of(context).textTheme.labelLarge
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Welcome to Coffee Browser!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown[700],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'This app is part of an auto_route workshop - Level 2: Advanced Features.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Learning Topics',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown[700],
            ),
          ),
          const SizedBox(height: 12),
          _buildLearningItem('Authentication with route guards'),
          _buildLearningItem('Nested navigation with tabs'),
          _buildLearningItem('Query parameters and path parameters'),
          _buildLearningItem('Protected routes and auth flow'),
          _buildLearningItem('Tab-based navigation patterns'),
        ],
      ),
    );
  }

  Widget _buildLearningItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb,
            size: 20,
            color: Colors.amber,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
