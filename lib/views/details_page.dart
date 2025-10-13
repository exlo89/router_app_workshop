import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_app/data/model/cafe.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  final Cafe cafe;

  const DetailsPage({super.key, required this.cafe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cafe.name),
      ),
      body: Center(
        child: Text(widget.cafe.description),
      ),
    );
  }
}
