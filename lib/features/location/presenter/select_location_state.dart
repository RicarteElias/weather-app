import 'package:flutter/material.dart';
import 'package:weather_app/features/location/presenter/select_location_screen.dart';

class SelectLocationState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(Icons.add_location_rounded),
          onPressed: () {},
          label: Text("Localização"),
        ),
      ),
    );
  }
}
