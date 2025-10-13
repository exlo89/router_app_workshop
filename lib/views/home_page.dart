import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_app/components/cafe_tile.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/data/model/cafe.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final cafe = Cafe.sampleCafes.elementAt(index);
            return CafeTile(
              cafe: cafe,
              onTap: () {
                context.router.push(DetailsRoute(cafe: cafe));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16);
          },
          itemCount: Cafe.sampleCafes.length,
        ),
      ),
    );
  }
}
