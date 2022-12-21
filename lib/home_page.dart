import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double latitude = 0;
  double longitude = 0;

  permissions() async {
    await Permission.location.request();
  }

  liveCoordinates() async {
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    });
  }

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition position;

  @override
  void initState() {
    super.initState();
    permissions();
    liveCoordinates();
    position = CameraPosition(
      target: LatLng(latitude, longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locator App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          liveCoordinates();
          setState(() {
            position = CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 12,
            );
          });
          final GoogleMapController controller = await mapController.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(position));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.gps_fixed, color: Colors.black),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Your Live Co-ordinates",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$latitude, $longitude",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 15,
              child: GoogleMap(
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                  },
                  initialCameraPosition: position,
                  markers: <Marker>{
                    Marker(
                      markerId: const MarkerId("Current Location"),
                      position: LatLng(latitude, longitude),
                    ),
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
