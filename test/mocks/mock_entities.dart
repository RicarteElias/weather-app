import 'package:flutter/cupertino.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/features/location/domain/entities/address.dart';
import 'package:weather_app/features/location/domain/entities/address_component.dart';
import 'package:weather_app/features/location/domain/entities/geometry.dart';
import 'package:weather_app/features/location/domain/entities/location.dart';

@GenerateMocks([Address, Geometry, Location, AddressComponent])
@immutable
class MockEntities {}
