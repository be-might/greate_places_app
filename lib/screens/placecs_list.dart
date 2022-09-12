import 'package:flutter/material.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';

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
      body: const Center( 
        child: CircularProgressIndicator(),
      ),
    );
  }
}