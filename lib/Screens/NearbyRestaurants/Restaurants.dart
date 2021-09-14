import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

final places= GoogleMapsPlaces(apiKey: 'AIzaSyAgelTxEWzhL_XZsRJOtmZxYpGJCunTv0A');
class Restaurant extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Nearby Restaurants"),
          backgroundColor: Colors.green,
        ),
      body: NearbyRestaurants(),

    );
  }
}
class NearbyRestaurants extends StatefulWidget{
  @override
  State <StatefulWidget> createState(){

    return _NearbyRestaurantsState();
  }
}
class _NearbyRestaurantsState extends State <NearbyRestaurants>{
  Future<Position> _currentLocation;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _currentLocation = Geolocator.getCurrentPosition();
  }

  Future<void> _retrieveNearbyRestaurants(LatLng _userLocation) async {
    PlacesSearchResponse _response = await places.searchNearbyWithRadius(
        Location(), 10000,
        type: "restaurant");

    Set<Marker> _restaurantMarkers = _response.results
        .map((result) => Marker(
        markerId: MarkerId(result.name),
        // Use an icon with different colors to differentiate between current location
        // and the restaurants
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
            title: result.name,
            snippet: "Ratings: " + (result.rating?.toString() ?? "Not Rated")),
        position: LatLng(
            result.geometry.location.lat, result.geometry.location.lng)))
        .toSet();

    setState(() {
      _markers.addAll(_restaurantMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _currentLocation,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // The user location returned from the snapshot
              Position snapshotData = snapshot.data;
              LatLng _userLocation =
              LatLng(snapshotData.latitude, snapshotData.longitude);

              if (_markers.isEmpty) {
                _retrieveNearbyRestaurants(_userLocation);
              }

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _userLocation,
                  zoom: 14,
                ),
                markers: _markers
                  ..add(Marker(
                      markerId: MarkerId("User Location"),
                      infoWindow: InfoWindow(title: "User Location"),
                      position: _userLocation)),
              );
            } else {
              return Center(child: Text("Failed to get user location."));
            }
          }
          // While the connection is not in the done state yet
          return Center(child: CircularProgressIndicator());
        });
  }
}