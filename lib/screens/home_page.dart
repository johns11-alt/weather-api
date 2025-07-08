import 'package:flutter/material.dart';
import 'package:weather/screens/map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _handleTap(BuildContext ctx) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => const MapPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Testing!')),
      body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(
            8.0,
          ), // match Container border radius
          onTap: _handleTap(context),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Weather API'),
                Icon(
                  Icons.cloud,
                ), // Use Icon instead of IconButton since whole area is clickable
              ],
            ),
          ),
        ),
      ),
    );
  }
}
