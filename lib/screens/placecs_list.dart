import 'package:flutter/material.dart';
import 'package:greate_places_app/providers/great_places.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';
import 'package:greate_places_app/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routName);
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<GreatPlaces>(context).fetchAndSetPlaces(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<GreatPlaces>(
                        builder: (context, value, ch) => value.items.length <= 0
                            ? ch!
                            : ListView.builder(
                                itemCount: value.items.length,
                                itemBuilder: (context, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(value.items[index].image!),
                                  ),
                                  title: Text(value.items[index].title),
                                  subtitle: Text(
                                      value.items[index].location!.address!),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        PlaceDetailScreen.routName,
                                        arguments: value.items[index].id);
                                  },
                                ),
                              ),
                        child: Center(
                          child: Text('No places'),
                        ),
                      )));
  }
}
