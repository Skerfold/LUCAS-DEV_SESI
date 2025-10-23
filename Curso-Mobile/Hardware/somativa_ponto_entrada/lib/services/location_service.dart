import 'package:geolocator/geolocator.dart';

class LocationService {
  // Workplace coordinates (example: latitude and longitude of the workplace)
  static const double workplaceLatitude = -23.550520; // Example: São Paulo
  static const double workplaceLongitude = -46.633308;
  static const double maxDistance = 100.0; // 100 meters

  Future<Position?> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  bool isWithinWorkplace(Position position) {
    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      workplaceLatitude,
      workplaceLongitude,
    );
    return distance <= maxDistance;
  }
}
