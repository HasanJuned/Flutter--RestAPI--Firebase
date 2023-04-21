import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

main() {
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapViewScreen(),
    );
  }
}

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  Position? currentLocation;

  void listenToLatestLocation(){
    Geolocator.getPositionStream(locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
      timeLimit: Duration(seconds: 3)
    )).listen((event) {
      print(event);
    });
  }

  @override
  void initState() {
    super.initState();
    listenToLatestLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),

      body: Center(
        child: Text(currentLocation.toString()),
      ),

      // GoogleMap(
      //     initialCameraPosition: CameraPosition(
      //         target: LatLng(23.793895737073488, 90.40448580672911)),
      //   ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// Get location permission
          LocationPermission locationPermission = await Geolocator.requestPermission();

          if (locationPermission == LocationPermission.always ||
              locationPermission == LocationPermission.whileInUse) {
            /// Fetch the current location
            currentLocation = await Geolocator.getCurrentPosition();
            print(currentLocation);
            setState(() {});
          } else {
            print('Permission not allowed');
          }
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
