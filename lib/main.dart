import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  late GoogleMapController googleMapController;

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

      body: GoogleMap(
        zoomControlsEnabled: true,
        //zoomGesturesEnabled: false,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,

        onTap: (LatLng position){
          print(position);
        },

        mapType: MapType.normal,

        /// These 4 are most important
        markers: <Marker>{
          const Marker(
              markerId: MarkerId('vivasoft-office'),
              position: LatLng(23.793895737073488, 90.40448580672911),
              infoWindow: InfoWindow(title: 'Vivasoft Office')
          ),
          Marker(
              markerId: MarkerId('draggable'),
              position: LatLng(23.792507438554292, 90.40466889739038),
              infoWindow: InfoWindow(title: 'Draggable'),
              draggable: true,
              onDrag: (LatLng initLatLng) {
                // print(initLatLng);
              },
              onDragEnd: (LatLng onDragEnd) {
                print(onDragEnd);
              },
              onDragStart: (LatLng onDragStart) {
                print(onDragStart);
              }
          ),
          Marker(
              markerId: const MarkerId('sheraton-office'),
              position: const LatLng(23.797184856841486, 90.40651660412549),
              infoWindow: const InfoWindow(title: 'Sheraton office'),
              draggable: true,
              onDrag: (LatLng initLang){

              },
              onDragStart: (LatLng onStartDrag){

              },
              onDragEnd: (LatLng onEndDrag){

              },
              /// icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan), // it's change the marker color
          ),
        },
        circles: <Circle>{
          Circle(
              circleId: const CircleId('office-circle'),
              center: const LatLng(23.797184856841486, 90.40651660412549),
              radius: 100,
              fillColor: Colors.purple.shade100,
              strokeWidth: 5,
              strokeColor: Colors.pink
          ),
          Circle(
              circleId: const CircleId('office-circle'),
              center: const LatLng(23.793895737073488, 90.40448580672911),
              radius: 100,
              fillColor: Colors.yellowAccent.shade100,
              strokeWidth: 5,
              strokeColor: Colors.pink
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: const PolygonId('polygon-id'),
            visible: true,
            fillColor: Colors.teal.shade100,
            strokeWidth: 5,
            strokeColor: Colors.teal,
            points: const [
              LatLng(23.79233594740147, 90.40227334946394),
              LatLng(23.790586970145448, 90.4040365666151),
              LatLng(23.79284275065543, 90.40801629424095),
              LatLng(23.788566459488845, 90.40479362010956)
            ]
          )
        },
        polylines: <Polyline>{
          const Polyline(
            polylineId: PolylineId('poliLine-id'),
            width: 4,
            color: Colors.blue,
            points: [
              LatLng(23.79869017234335, 90.40146198123693),
              LatLng(23.796340927682056, 90.40237493813038),
              LatLng(23.802613359164134, 90.40529653429986),
              // LatLng(23.79869017234335, 90.40146198123693),
            ]
          )
        },

        initialCameraPosition: const CameraPosition(
            target: LatLng(23.793895737073488, 90.40448580672911),
            zoom: 16,
            bearing: 0, // rotate the map
            tilt: 0, // mapView similar to walking
        ),

        onMapCreated: (controller){
          googleMapController = controller;
        },
      ),
    );
  }
}

