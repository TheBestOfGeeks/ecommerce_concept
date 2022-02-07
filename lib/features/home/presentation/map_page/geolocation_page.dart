import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeolocationPage extends StatefulWidget {
  @override
  State<GeolocationPage> createState() => MapSampleState();
}

class MapSampleState extends State<GeolocationPage> {

  static const String MARKER = "Marker";

  Completer<GoogleMapController> _controller = Completer();

  Position? currentPosition;
  var geoLocator = Geolocator();

  Future<void> locatePosition() async {
    Position position = await _determinePosition();
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPosition, zoom: 14);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(55.75426297449727, 37.62139697119701),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {
          _oneMarker,
          _twoMarker,
          _threeMarker,
          _fourMarker,
          _fiveMarker,
          _sixMarker,
          _sevenMarker,
          _eightMarker,
          _nineMarker,
          _tenMarker,
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: locatePosition,
        label: Text(AppLocalizations.of(context)!.find_me),
        icon: Icon(Icons.my_location),
      ),
    );
  }


  static const _oneMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.75426297449727, 37.62139697119701),
  );
  static const _twoMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.84502334796386, 37.59865174623737),
  );
  static const _threeMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.794595163039375, 37.480269658855754),
  );
  static const _fourMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.633372870442166, 37.640280612129814),
  );
  static const _fiveMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.71186864318277, 37.49588048356542),
  );
  static const _sixMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.74410159800171, 37.78858344687162),
  );
  static const _sevenMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.70820412348918, 37.60775806065134),
  );
  static const _eightMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.80336997736761, 37.421729066194516),
  );
  static const _nineMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.85962799780287, 37.72614014803296),
  );
  static const _tenMarker = Marker(
    markerId: MarkerId(MARKER),
    infoWindow: InfoWindow(title: MARKER),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(55.67740858635823, 37.38140110236122),
  );
}




Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();


  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        '');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}