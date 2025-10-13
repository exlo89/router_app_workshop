import 'package:flutter/material.dart';
import 'package:router_app/data/model/cafe.dart';

class CafeTile extends StatelessWidget {
  final Cafe cafe;
  final VoidCallback onTap;

  const CafeTile({
    super.key,
    required this.cafe,
    required this.onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cafe.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
             cafe.address,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
