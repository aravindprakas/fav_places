import 'package:fav_place/models/place.dart';
import 'package:fav_place/screens/map_screen.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});

  final Place place;
  String get locationImage {
    final lat = place.placeLocation.latitude;
    final lon = place.placeLocation.longitude;

    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lon&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lon&key=AIzaSyDSVWhxlo3LLBIZouGjXQgjAPO9Jn9D9vo";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            place.title,
          ),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => MapScreen(
                              location: place.placeLocation,
                              isSelecting: false,
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(locationImage),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black54],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Text(
                        place.placeLocation.address,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
