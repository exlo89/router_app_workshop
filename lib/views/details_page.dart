import 'package:flutter/material.dart';
import 'package:router_app/data/model/cafe.dart';
import 'package:router_app/services/favorites_service.dart';

class DetailsPage extends StatefulWidget {
  final Cafe cafe;

  const DetailsPage({super.key, required this.cafe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final FavoritesService _favoritesService = FavoritesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cafe.name),
        actions: [
          IconButton(
            icon: Icon(
              _favoritesService.isFavorite(widget.cafe.id) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              setState(() {
                _favoritesService.toggleFavorite(widget.cafe.id);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
              ),
              child: Image.network(
                widget.cafe.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.local_cafe,
                      size: 100,
                      color: Colors.brown.shade300,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.cafe.name, style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          spacing: 4,
                          children: [
                            const Icon(Icons.star, size: 18, color: Colors.amber),
                            Text(widget.cafe.rating.toStringAsFixed(1), style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(Icons.location_on, color: Colors.brown),
                          Expanded(
                            child: Text(
                              widget.cafe.address,
                            ),
                          ),
                        ],
                      ),
                      // Opening Hours
                      Row(
                        spacing: 8,
                        children: [
                          const Icon(Icons.access_time, color: Colors.brown),
                          Expanded(
                            child: Text(
                              widget.cafe.hours,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(
                            widget.cafe.hasWifi ? Icons.wifi : Icons.wifi_off,
                            color: widget.cafe.hasWifi ? Colors.green : Colors.grey,
                          ),
                          Text(
                            widget.cafe.hasWifi ? 'Free WiFi available' : 'No WiFi',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.cafe.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
