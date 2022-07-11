import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../widgets/spinner.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GPS")),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Coordenadas'),
                Expanded(
                  child: FutureBuilder(
                    future: _getLocation(),
                    builder: (context, AsyncSnapshot<LocationData?> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Latitude: ${snapshot.data!.latitude.toString()}'),
                            Text(
                                'Longitude: ${snapshot.data!.longitude.toString()}'),
                          ],
                        );
                      } else {
                        return const Spinner();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<LocationData?> _getLocation() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  locationData = await location.getLocation();
  return locationData;
}
