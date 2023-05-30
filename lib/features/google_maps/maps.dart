import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => MapsViewState();
}

class MapsViewState extends State<MapsView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

// Markers
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygons = HashSet<Polygon>();
  final Set<Polyline> _polyLines = {};
  List<LatLng> polygonLatLngs = [];

  void onTapAddMarker(LatLng latLng) async {
    // var uuid = const Uuid();
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
            infoWindow: InfoWindow(
              title: (polygonLatLngs.length + 1).toString(),
              snippet: "So this is snippet",
            ),
            icon: BitmapDescriptor.defaultMarker,
            // on tap to remove marker
            onTap: () {
              setState(() {
                _markers.removeWhere(
                    (element) => element.markerId.value == latLng.toString());
                // _polygons.removeWhere(
                //     (element) => element.polygonId.value == latLng.toString());
              });
            }),
      );
      polygonLatLngs.add(latLng);
      updatePolygons(latLng);
    });
    // _polygons.add(Polygon(polygonId: polygonId));
  }

  void updatePolygons(LatLng latLng) {
    _polyLines.add(
      Polyline(
        polylineId: PolylineId(latLng.toString()),
        points: polygonLatLngs,
        color: Colors.pink,
      ),
    );
    _polygons.add(
      Polygon(
        polygonId: PolygonId(latLng.toString()),
        points: polygonLatLngs,
        fillColor: Colors.yellow.withOpacity(0.5),
        strokeColor: Colors.pink,
        strokeWidth: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _markers.clear();
                _polygons.clear();
                _polyLines.clear();
                polygonLatLngs.clear();
              });
            },
            child: const Text(
              "Clear",
            ),
          )
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        polygons: _polygons,
        polylines: _polyLines,
        onTap: (latlng) {
          onTapAddMarker(latlng);
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
