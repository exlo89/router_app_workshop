import 'package:flutter/material.dart';
import 'package:router_app/data/model/cafe.dart';
import 'package:router_app/services/favorites_service.dart';

class CafeTile extends StatelessWidget {
  final Cafe cafe;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavouriteTap;


  const CafeTile({
    super.key,
    required this.cafe,
    this.isFavorite = false,
    required this.onTap,
    required this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.brown[50],
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.brown.withOpacity(0.1),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        cafe.name,
                        style: Theme.of(context).textTheme.titleMedium
                      ),
                      if (cafe.hasWifi)
                        const Icon(
                          Icons.wifi,
                          size: 18,
                          color: Colors.green,
                        ),
                    ],
                  ),
                  Text(
                    cafe.address,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      Text(
                        cafe.rating.toStringAsFixed(1),
                        style: TextStyle(fontSize: 14.0, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavouriteTap
            ),
          ],
        ),
      ),
    );
  }
}
