import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? selectedPosition;
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Lokasi'),
        backgroundColor: const Color(0xFF0C9869),
        foregroundColor: Colors.white,
        elevation: 0,
      ),     
       body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-6.200000, 106.816666), // Jakarta
              zoom: 14.0,
            ),
            onTap: (position) async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                position.latitude,
                position.longitude,
              );

              String alamat = [
                placemarks.first.name,
                placemarks.first.street,
                placemarks.first.subLocality,
                placemarks.first.locality,
                placemarks.first.country,
              ].where((e) => e != null && e!.isNotEmpty).join(', ');

              setState(() {
                selectedPosition = position;
                selectedAddress = alamat;
              });
            },
            markers: selectedPosition != null
                ? {
                    Marker(
                      markerId: const MarkerId('selected'),
                      position: selectedPosition!,
                    )
                  }
                : {},
          ),  
          if (selectedAddress != null)
            Positioned(
              bottom: 90,
              left: 16,
              right: 16,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    selectedAddress!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),        
        ],
      ),
    );
  }
}