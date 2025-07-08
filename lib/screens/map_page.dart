import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  const apiKey = 'AIzaSyCqHkKIk7LFJuK7_Cc0rP5isCgGuJG7Bok';
  final LatLng _center = const LatLng(38.246639, 21.734573);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: const Center(
        // <-- Εδώ μέσα το Center
        child: Text('map'),
      ),
    );
  }
}


// AIzaSyCqHkKIk7LFJuK7_Cc0rP5isCgGuJG7Bok